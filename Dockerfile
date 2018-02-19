### STAGE 1: Build ###

# We label our stage as 'builder'
FROM node:8-alpine

RUN apk update && apk add nginx
RUN adduser -D -g 'www' www && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www

WORKDIR ~/app

COPY package.json ./
COPY . .

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm install

RUN npm install -g @angular/cli@1.6.7
# WORKDIR /home/app



# RUN ls -la

## Build the angular app in production mode and store the artifacts in dist folder
RUN ng build -prod -aot


# FROM nginx
COPY ./dist /usr/share/nginx/html
EXPOSE 80

CMD ["rc-service" "nginx" "start"]
