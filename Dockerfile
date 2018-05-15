FROM node:9

# The image is designed for production, therefore it doesn't rely on GIT to get the JS source code.
# Instead you need to copy it in the same directory as the Dockerfile.

# Create app directory
WORKDIR /usr/src/geocoder-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./geocoder-api/package*.json ./ 
RUN npm install --only=production

# Bundle app source
COPY ./geocoder-api/ ./

EXPOSE 8080

CMD [ "npm", "start" ]
