# Web App

Just another hodgepodge web app with TypeScript and Nuxt

## Docker

`docker build -t nuxt-app:$(git rev-parse --short=6 HEAD) .`

`docker run --name nuxt-app -p 3000:3000 nuxt-app:$(git rev-parse --short=6 HEAD)`

## Docker Compose

`docker compose up -d`