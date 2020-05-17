# Debug the docker container, which can emulate Dockerrun.aws.json instructions
# This only used with the Dockerfile to debug and has nothing to do with the AWS deployment. 
# Although it could be used to deploy to ECS.

# Build docker
# NOTE: Increment the version when you change the DockerFile config
docker build -t donnelson/dartwebserver:1.2 .

# Run docker
docker run -dit  -p 80:8080  donnelson/dartwebserver:1.2

# List dockers
docker ps

# Bash into the container
# docker exec -it [container_id] /bin/bash

# Stop the docker container
# docker stop [contaienr_id]