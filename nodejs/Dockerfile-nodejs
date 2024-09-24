# syntax=docker/dockerfile:1
# Stage build
FROM node:16 as depends

WORKDIR /usr/src/build/app

COPY package.json package-lock.json ./

RUN --mount=type=cache,target=/root/.npm npm i

# Stage run
FROM node:16-alpine as runtime

WORKDIR /usr/src/app

COPY --from=depends /usr/src/build/app/node_modules /usr/src/app/node_modules

COPY . .

EXPOSE 3001

CMD [ "node", "index.js" ]