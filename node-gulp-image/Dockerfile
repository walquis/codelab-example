FROM node

WORKDIR /www

COPY package.json .
COPY package-lock.json .

RUN mkdir /nonexistent && chmod -R 0777 /www /nonexistent && chown -R nobody: /www

RUN npm install && npm install gulp-cli
