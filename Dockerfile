# Dockerfile

# To select OS image from Docker Hub. base image as tag
# Docker Hub - a global repo that contains images that we can pull down locally.
# Here, we choose an image based on Ubuntu that has Node.js installed, and it's called Node. To specify that we want the latest version, use the following tag :latest.
FROM node:latest
# Set a working directory
WORKDIR /app
# Copy files from the directory we are standing in, to the directory specified by the WORKDIR command
COPY . .
# Added this so we don't have static values like 'EXPOSE 3000', and we can refer to this value in app.js
ENV PORT=3000
# Runs a command in the terminal - here, we install all the libraries (listed under package.json > dependencies) we need to build our Node.js Express appl
RUN npm install
# Opening up the network port that this container should listen on at runtime - we communicate with our container on this port
# Updated 'EXPOSE 3000' to 'EXPOSE $PORT' - getting rid of static values and relying on variables
EXPOSE $PORT
# State how to start up our app, and needs to be specified as an array - here, this translates to 'node app.js' in the terminal
ENTRYPOINT ["node", "app.js"]

# Whenever we change app.js, we need to 1. tear down our container (docker stop & dccker rm), 2. rebuild our image (docker build)