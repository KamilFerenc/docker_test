 FROM node:alpine as builder

 WORKDIR "/app"
 COPY package.json .
#  install dependencies
 RUN npm install 

COPY . . 

RUN npm run build 

# app/build <--- all the stuff built in the previous steps

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
