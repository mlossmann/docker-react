FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

### Builder step ends here, builder is just a tag, you can name it whatever you want 
### and where ever builder is below, we can name it whatever we want

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html