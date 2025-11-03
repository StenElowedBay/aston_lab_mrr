# Этап сборки - используем Node.js 14 который совместим с Angular 7
FROM node:14-alpine AS build

WORKDIR /app

# Копируем зависимости и устанавливаем их
COPY package.json package-lock.json ./
RUN npm install

# Копируем исходный код и собираем приложение
COPY . .
RUN npm run build --prod

# Этап запуска
FROM nginx:alpine

# Копируем собранное приложение (правильный путь)
COPY --from=build /app/dist/kanban-ui /usr/share/nginx/html

# Копируем конфигурацию nginx
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
