# Simple Node.js web application

This simple Node.js application is used for the Udemy course by Stephen Grider:

[Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/)

## Start the application via npm

Make sure that all dependencies are install by running...

    npm install

... and then start the application by running

    npm start

## Start the application by using docker

Build the docker container - this step has only be done once, or once more ;) if you have made changes to the Dockerfile:

    docker build .

During the build look into your console, you'll see some like...

    => => writing image sha256:a0eb8435b01d03aa57b91dea29c17e2573456862448a0aeae5e575baa2f3c516 

... where everything after **sha256:** is the container hash which you need to run your container, like this:

    docker run -p 3333:8080 a0

FYI:
* the **-p** flag stands for **port**. The first number is the port on your local system (here 3333) which is connected to the port inside the docker container (here 8080). So from the *outside* to the *inside* (something I still have to look up once in a while)
* And you don't have to copy and paste the whole ugly hash, or at least it is ugly for us humans - maybe machines find them beautiful, instead it is enough to provide a few chars as the hash is unique for docker - thanks docker for this - in my case "a0" is already unique
* gotcha: Did you try to use my hash "a0" to run your container? Let me know if it worked, if so then you were extremely lucky, I mean extrem extremely - impossible extrem to be honest. So make sure to look into your terminal as mentioned above to get your own hash ;)

If you don't want to juggle with the hashes then you could also give the build a **tag**, like this...

    docker build -t <your-docker-hub-id>/<any-name-you-like> .

... and afterwards you can run the container by using the tag:

     docker run -p 3333:8080 <your-docker-hub-id>/<any-name-you-like>

For example for me the commands look like this:

    docker build -t lxkrmr/simple-nodejs-web-app .
    docker run -p 3333:8080 lxkrmr/simple-nodejs-web-app

FYI:

Yes I know \<your-docker-hub-id>/\<any-name-you-like> is strictly not a tag, but don't be so strict at the moment. It is working, isn't it?