FROM node:latest as builder
WORKDIR /usr/src/app
COPY package.json /usr/src/app/package.json
RUN npm install
COPY . /usr/src/app
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html