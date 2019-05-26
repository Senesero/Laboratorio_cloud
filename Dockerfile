FROM ubuntu:18.04

WORKDIR /opt/app

COPY . .

RUN apt-get update && apt-get install -y curl gnupg \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN npm install --only=production

EXPOSE 8888 

CMD ["npm", "start"]