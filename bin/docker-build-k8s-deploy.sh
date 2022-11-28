image_tag=$(date +%Y-%m-%d_%H-%M-%S)

docker build -t prod.harbor.drw/apprenticeship/codelabs:$image_tag .

docker push  prod.harbor.drw/apprenticeship/codelabs:$image_tag

harbor_url=prod.harbor.drw/apprenticeship/codelabs

sed -i '' "s#${harbor_url}.*#${harbor_url}:$image_tag#" deploy/deployment.yml

kubectl apply -f deploy
