project=$(../../terraform show |grep -w project|sort -u|sed 's/^.*= //g')
cluster=$(../../terraform show |grep "  name ="|sort -u|sed 's/^.*= //g')
location=$(gcloud container clusters list|grep ^${cluster}|awk '{print $2}')

gcloud container clusters get-credentials ${cluster} --region=${location}
echo y|gcloud auth configure-docker
docker build -t gcr.io/${project}/hello-node:v1 helloworld
docker push gcr.io/${project}/hello-node:v1 

kubectl run hello-node --image=gcr.io/${project}/hello-node:v1 --port=8080
kubectl expose deployment hello-node --type="LoadBalancer"
sleep 60

external=$(kubectl get services hello-node|grep ^hello-node|awk '{print $4}')
response=$(curl -s http://${external}:8080)

if [ "${response}" != "Hello World!" ]; then
  echo "Deployment unsuccesful"
else
  echo "${response}- Succesful Deployment"
  echo "Tearing down deployment"
  kubectl delete service hello-node
  kubectl delete deployment hello-node
fi
