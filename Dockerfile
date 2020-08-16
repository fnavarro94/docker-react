FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npx create-react-app frontend 
RUN ls frontend/
RUN mv   frontend/* .
RUN ls 
RUN rm -rf frontend
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

