# FROM cypress/included:5.1.0
FROM cypress/base:10
#FROM cypress/browsers:chrome69

RUN mkdir -p /e2e

WORKDIR /e2e

COPY package.json .

RUN npm install

COPY . .

RUN chmod +x scripts/startup.sh

RUN apt-get update

RUN apt-get -y install curl

RUN npm run cy:verify