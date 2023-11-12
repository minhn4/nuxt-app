FROM --platform=linux/amd64 node:20-alpine AS base

##### DEPENDENCIES

FROM base AS deps
WORKDIR /app

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine
# to understand why libc6-compat might be needed.
# Install OpenSSL 1.1.x, needed for Prisma in Linux Alpine 3.17+
RUN apk add --no-cache libc6-compat openssl1.1-compat

# Install dependencies based on the preferred package manager
COPY package.json pnpm-lock.yaml* yarn.lock* package-lock.json* ./
RUN \
 if [ -f pnpm-lock.yaml ]; then npm install -g pnpm && pnpm i --frozen-lockfile; \
 elif [ -f yarn.lock ]; then yarn --frozen-lockfile; \
 elif [ -f package-lock.json ]; then npm ci; \
 else echo "Lockfile not found." && exit 1; \
 fi

##### BUILDER

FROM base AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN \
 if [ -f pnpm-lock.yaml ]; then npm install -g pnpm && SKIP_ENV_VALIDATION=1 pnpm build; \
 elif [ -f yarn.lock ]; then SKIP_ENV_VALIDATION=1 yarn build; \
 elif [ -f package-lock.json ]; then SKIP_ENV_VALIDATION=1 npm run build; \
 else echo "Lockfile not found." && exit 1; \
 fi

##### RUNNER

FROM base AS runner
WORKDIR /app

ENV NODE_ENV production

COPY --from=builder /app/.output/  ./.output/

EXPOSE 3000
ENV HOST 0.0.0.0

CMD [ "node", ".output/server/index.mjs" ]