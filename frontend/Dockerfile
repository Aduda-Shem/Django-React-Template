FROM node:16-alpine

WORKDIR /app/backend

COPY package.json package-lock.json /app/backend/

RUN npm install

COPY . /app/backend/

CMD [ "npm", "run", "watch" ]
