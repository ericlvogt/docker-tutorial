# see running containers
docker ps

# start new container using specified image
# and port
# -d means run as daemon
# -p is port
# 80:80 {port on local machine}:{port on container}
# docker/getting-started {docker image}
docker run -d -p 80:80 docker/getting-started

#another docker run
# -c is run command
docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"

# docker run
# not sure about -it but looks like it is an alternative
# to -c
docker run -it ubuntu ls /

#docker run with volume
# -v volume
# todo-db:/etc/todos - {volume name}:{mapping on container}
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

#another docker run with volume mounted to present working directory
# $(pwd) is present working directory
# -w is container working directory
docker run -dp 3000:3000 `
    -w /app -v "$(pwd):/app" `
    node:18-alpine `
    sh -c "yarn install && yarn run dev"

#docker run specifying network to inspect
docker run -it --network todo-app nicolaka/netshoot

#execute on container
docker exec {container-id} cat /data.txt

# build docker image using Dockerfile
# -t tag
# getting-started image tag
docker build -t getting-started

#stop docker container
docker stop {id}

#remove docker container
# -f is force so you can remove a running container
docker rm -f {id}

#push docker image to Docker Hub
docker push docker/getting-started

#tag an image with a new name
#username corresponds to the docker hub user name
docker tag getting-started {username}/getting-started

#create a docker volume
docker volume create todo-db

#details of volume
docker volume inspect todo-db

#create network
docker network create todo-app

#using docker compose file start containers
docker compose up -d

#tear down containers
docker compose down

#scan image for vulnerabilities
docker scan {image}

#see the docker build image history
docker image history --no-trunc getting-started