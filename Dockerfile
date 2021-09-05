FROM node:alpine as builder
WORKDIR '/user/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /user/app/build /user/share/nginx/html