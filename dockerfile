FROM cirrusci/flutter:stable as build

WORKDIR /app

COPY . .

RUN flutter pub get && flutter build web

FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
