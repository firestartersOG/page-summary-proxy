FROM node:10-alpine

RUN mkdir -p /src/app

WORKDIR /src/app

# Install app dependencies
COPY package.json /src/app/
RUN npm install

# Bundle app source
COPY . /src/app

RUN apk update && apk add bash coreutils

EXPOSE 3000

# ENTRYPOINT [ "executable" ]
CMD [ "npm", "start" ]

# How to run this:
# In terminal, cd to this directory (Jessica-proxy)
# Build the image: `docker build -t Jessica-proxy .`
# Run `docker images` to check and see if the image is there.
# `docker run -d -p 3000:3000 --rm Jessica-proxy`
# Should show up when you run `docker ps`
# Visit localhost:3001 to see it in browser