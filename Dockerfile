FROM node:12

ENV NODE_ENV production

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm ci --only=production

COPY . .

RUN cd ./client && npm ci --only=production && npm run build

EXPOSE 4001

CMD ["node", "server/server.js"]