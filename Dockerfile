#Stage 1
FROM node:14.15.4-alpine AS build
WORKDIR /app
COPY package.json package.json ./

RUN npm install
COPY . .

RUN npm run build -- --prod
##Stage 2##

FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /user/src/app/dist/shop4less  /user/shere/nginx/html
#docker build -t shop4less .