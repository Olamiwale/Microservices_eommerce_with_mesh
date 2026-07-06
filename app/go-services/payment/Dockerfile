
FROM golang:1.23-alpine

WORKDIR /app

COPY main.go .

RUN go build -o app main.go

CMD ["./app"]





# FOR LOCAL TESTING ONLY
# Build the image (must match name in deployment yaml)

# docker build -t payment-service:latest ./app/go-services/payment

####### verify the image
# docker images | payment-service

####### Run container locally to test before deploying
# docker run -p 8080:8080 payment-service:latest

####### Test it responds
# curl http://localhost:8080

####### Stop the container
# docker stop $(docker ps -q)



# create namespace that metches the one in deployment yaml

# set imagePullPolicy to Never in deployment yaml file for local testing with minikube because the image is built locally and not pushed to a registry  

# # Apply cart deployment
# kubectl apply -f gitops/base/deployments/cart/deployment-v1.yaml
# kubectl apply -f gitops/base/deployments/cart/service.yaml
