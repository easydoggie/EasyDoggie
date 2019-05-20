FROM node:10.15.3-alpine
WORKDIR /app
EXPOSE 8081
COPY src /app

RUN npm init -f
RUN npm install --save express && \
    npm install --save socket.io

CMD ["node", "server.js"]
