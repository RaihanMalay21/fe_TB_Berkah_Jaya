# membuat react application
FROM node:22-alpine3.19 AS builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build

# menyajikan react application
FROM node:22-alpine3.19
WORKDIR /app
COPY --from=builder /app/build /app/build
RUN npm install -g serve
EXPOSE 5000
CMD ["serve", "-s", "build"]
