
# Used for debugging the Dockerrun.aws.json configuration
# This has nothing to do with the AWS Dockerrun.aws.json configuration in this application configuration
# Emulate the `eb local run` envionment with sh ./debug-docker-container-config.sh.

FROM google/dart

WORKDIR /app

# Emulate AWS docker container parent/guest volume/mount points
COPY ./server /app/server

# Same location as specificed in Dockerrun.aws.json
CMD dart /app/server/lib/server.dart

EXPOSE 8080
