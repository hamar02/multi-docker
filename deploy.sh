docker build -t hamaro/multi-client:latest -t hamaro/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hamaro/multi-server:latest -t hamaro/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hamaro/multi-worker:latest -t hamaro/multi-worker:$SHA -f ./worker/Dockerfile ./worker
#docker build -t hamaro/ue4:latest -f ./ue4/Dockerfile ./ue4

docker push hamaro/multi-client:latest
docker push hamaro/multi-client:$SHA
docker push hamaro/multi-server:latest
docker push hamaro/multi-server:$SHA
docker push hamaro/multi-worker:latest
docker push hamaro/multi-worker:$SHA
#docker push hamaro/ue4:latest

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hamaro/multi-server:$SHA
kubectl set image deployments/client-deployment client=hamaro/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=hamaro/multi-worker:$SHA
