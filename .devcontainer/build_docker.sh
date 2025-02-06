#!/bin/bash

echo "Build the docker"

docker buildx build -f Dockerfile \
               --no-cache=false \
               --progress=plain \
               --build-arg PROJECT_NAME="EIA Data Automation" \
               --build-arg VENV_NAME="LEARN_GITHUB_ACTIONS" \
               --build-arg DEBIAN_FRONTEND=noninteractive \
               --build-arg QUARTO_VER=1.6.40 \
               --tag portolan75/ubuntu2404_python311_github:prod \
               .

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push portolan75/ubuntu2404_python311_github:prod
else
echo "Docker build failed"
fi
