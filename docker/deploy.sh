#!/bin/bash

DOCKER_IMAGE=$1
GCLOUD_SERVICE_KEY=$2

echo $GCLOUD_SERVICE_KEY > ~/gcloud-service-key.json
chmod 666 ~/gcloud-service-key.json

echo "Logando no registry do google"
docker login -u _json_key -p "$(cat ~/gcloud-service-key.json)" https://gcr.io

echo "Limpando imagens"
docker rmi "$(docker image ls -q)"

echo "Inicializando o container com a nova imagem"
docker stop "$(docker ps -q)"

docker run -d --rm --name vh-dev -p 80:80 ${DOCKER_IMAGE}

echo "deploy.sh finalizado com sucesso"