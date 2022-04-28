# Specifiy a base image
FROM node:alpine

WORKDIR /usr/app

# Install some dependencies
# we are copying the package.json first to make sure that we only have to rebuild our container if a dependency has changed
# and not if we "only" changed something within the application code
COPY ./package.json ./
RUN npm install
# and then copy all other files. FYI: later this get optimized as well, but stick with me for the moment
COPY ./ ./

# Default command
CMD ["npm", "start"]