# Frontend stage

FROM node:latest AS frontend
WORKDIR /app
COPY ./package*.json /app/
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm", "start"]

