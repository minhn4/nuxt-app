FROM --platform=linux/amd64 node:20-alpine AS base

##### DEPENDENCIES

FROM base AS deps
WORKDIR /app

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine
# to understand why libc6-compat might be needed.
# Install OpenSSL 1.1.x, needed for Prisma in Linux Alpine 3.17+
RUN apk add --no-cache libc6-compat openssl1.1-compat

COPY package.json yarn.lock* ./
RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

##### BUILDER

FROM base AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN SKIP_ENV_VALIDATION=1 yarn build

RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

##### RUNNER

FROM base AS runner
WORKDIR /app

ENV NODE_ENV production

COPY --from=builder /app/.output/  ./.output/

EXPOSE 3000
ENV PORT 3000

CMD [ "node", ".output/server/index.mjs" ]