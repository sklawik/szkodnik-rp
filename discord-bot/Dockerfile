
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm prune --production

ENV NODE_ENV=production


EXPOSE 8081
CMD ["node", "index.js"]