#!/bin/bash

if [ -z "$(git status --porcelain)" ]; then
  echo Git status is clean, proceeding...
else
  echo Uncommitted changes, clean those up first.  Exiting...
  exit 1
fi

skip_push=
while getopts 's' opt; do
  case "$opt" in
    s)
      echo "Skipping Docker tag-create-build-push..."
      skip_push=yes
      ;;
  esac
done

harbor_url=prod.harbor.drw/apprenticeship/codelabs

if [[ "$skip_push" != "yes" ]]; then
  image_tag=$(date +%Y-%m-%d_%H-%M-%S)
  echo $image_tag > docker_image_version.txt

  sed -i '' "s#${harbor_url}.*#${harbor_url}:$image_tag#" deploy/deployment.yml

  sha=$(git rev-parse --short @)
  git add docker_image_version.txt deploy/deployment.yml
  git commit -m "Bumped image version to $image_tag. Building from $sha and publishing to Harbor..."
  git push

  docker build -t prod.harbor.drw/apprenticeship/codelabs:$image_tag .

  docker push prod.harbor.drw/apprenticeship/codelabs:$image_tag
else
  image_tag=`cat docker_image_version.txt`
  sed -i '' "s#${harbor_url}.*#${harbor_url}:$image_tag#" deploy/deployment.yml
fi

kubectl apply -f deploy
