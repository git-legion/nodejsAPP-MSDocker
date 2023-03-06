# Frontend stage

FROM node:latest AS frontend
WORKDIR /app
COPY FrontEnd/package*.json /app/
RUN npm install
COPY FrontEnd/. .
EXPOSE 5000
CMD ["npm", "start"]

# Backend stage

FROM node:alpine AS backend
WORKDIR /app
COPY backend/package*.json /app/
RUN npm install
COPY backend/. .
EXPOSE 8000
CMD ["npm", "start"]

# MySQL stage

FROM mysql:latest AS mysql
ENV MYSQL_DATABASE empoyees_db
COPY mysql/. /docker-entrypoint-initdb.d/

