docker build -t hamar02/multi-client:latest -t hamar02/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hamar02/multi-server:latest -t hamar02/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hamar02/multi-worker:latest -t hamar02/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hamar02/multi-client:latest
docker push hamar02/multi-client:$SHA
docker push hamar02/multi-server:latest
docker push hamar02/multi-server:$SHA
docker push hamar02/multi-worker:latest
docker push hamar02/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hamar02/multi-server:$SHA
kubectl set image deployments/client-deployment client=hamar02/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=hamar02/multi-worker:$SHA
