echo "Set up gcloud and kubectl credentials"
gcloud container clusters \
    get-credentials standard-cluster-1 \
    --zone us-central1-a

echo "Deploy the multi-server master controller and service"
kubectl create -f \
    server-master-deployment.yaml

kubectl get pods

kubectl create -f \
    server-master-service.yaml

kubectl get service

echo "Deploy the multi-worker controller and service"
kubectl create -f \
    worker-slave-deployment.yaml

kubectl get pods

kubectl create -f \
    worker-slave-service.yaml

kubectl get service

echo "Deploy the multi-client master controller and service"
kubectl create -f \
    client-master-deployment.yaml

kubectl get pods

kubectl create -f \
    client-master-service.yaml

kubectl get service

echo "Deploy the multi-nginx master controller and service"
kubectl create -f \
    nginx-master-deployment.yaml

kubectl get pods

kubectl create -f \
    nginx-master-service.yaml

echo "awaiting IP"
kubectl get services --watch
