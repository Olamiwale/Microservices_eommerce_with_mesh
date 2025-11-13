# Microservices E-commerce Platform

This is a microservice-based (e-commerce) designed to demonstrate DevOps best practices using Kubernetes,CI/CD pipelines and istio. The system is composed of seven services (cart,inventory,notification built with go, (order,product) node.js and shipping,user build with python) each running in its own container and orchestrated with Kubernetes.


Prerequisite
-Programming language - Node.js, Python, Go and Javascript (for building)
-Kubernetes for app orchestration
-docker for containerization
-istio for ingress mesh
-kustomization
-promethues 
-grafana
-terraform



Step 1. Environment setup (installation and configuration)
-python (link)
-node.js (link)
-go (link)
- vs code IDE (link)
- istio installation
- local registry or (Docker HUb), i used ACR (azure)

-file tree set-up


Step 2. Setting up services and test locally
-cart, product, inventory - Node.js and express
-notification, user, product - Go
-shipping - python

all api are tested locally and before implementing docker and kubernetes

step 3. Docker setup
Docker container were configure for all the service created 

image/video

step 4- Cloud integration (Azure)
Set-up Azure AKS ACR 
-create resource group
-create acr
-login to acr
-create aks
-merge acr to work with aks
kubectl get nodes (to test if node is connected and running)


step 5 -set up kubernetes deployment and service file

make sure the selector-image of the file is the same as the image you'll build new docker in the next step


step 6- build docker image and push to Azure registry


# Build Docker image
docker build -t briitzacr.azurecr.io/order-service:v1 . (Ensure image name is the)

# Log in to Azure Container Registry (ACR)
az acr login --name <my-acr-name> make sure you're login before pushing.

# Push the image to ACR
docker push <my-acr-name>.azurecr.io/my--name:v1
docker push briitzacr.azurecr.io/order-service:v1

## On Local: If using minikube

# Build Docker image
docker build -t order-service:v1

# login to docker locally
docker login

# Tag the image for ACR
docker tag my-image-name:v1 docker.io/my-image-name:v1

# Push the image to ACR
docker push docker.io/my-image-name:v1



step 7 - set up namespace, deployment and service file and apply all
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


step 8 - check id the apply is successfully build and running
kubectl get deployment -n your-namespace
kubectl get pods -n my-namespace

kubectl get service -n you-name-space

deployment pod should be 2/2 if everything is set up accordingly if getting error refer to <link> for image error troubleshooting



Step 9 - set up istio mesh for ingress routing


# Install Istio with demo profile
echo "Installing Istio control plane..."
istioctl install --set profile=demo -y

# Verify Istio installation
kubectl get pods -n istio-system

# Install Istio addons (Kiali, Prometheus, Grafana, Jaeger)
echo "Installing observability tools..."
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/addons/jaeger.yaml

# Wait for addons to be ready
kubectl rollout status deployment/kiali -n istio-system
kubectl rollout status deployment/grafana -n istio-system



# Wait for all deployments
echo "Waiting for deployments to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment --all -n my-namespace


# Verify Deployment

kubectl get pods -n ecommerce
kubectl get svc -n ecommerce
kubectl get virtualservices -n my-namespace
kubectl get destinationrules -n my-namespace

# Get Gateway IP


# Test Services

curl -s http://$GATEWAY_URL/api/products | jq '.' || curl -s http://$GATEWAY_URL/api/products


# Deploy Canary (10% traffic to v2)


kubectl apply -f canary_deployment.yaml


# Configure Fault Injection


kubectl apply -f fault_injection.yaml

echo "  kubectl create job --from=cronjob/fault-injection-test test-$(date +%s) -n ecommerce"

# STEP 9: Access Observability Tools

echo "Starting port-forwards for observability tools..."

# Kiali
kubectl port-forward -n istio-system svc/kiali 20001:20001 > /dev/null 2>&1 &
"Kiali (Service Mesh): http://localhost:20001"

# 
kubectl port-forward -n istio-system svc/grafana 3000:3000 
"Grafana (Metrics): http://localhost:3000"

# Jaeger
kubectl port-forward -n istio-system svc/tracing 16686:16686  &"Jaeger (Tracing): http://localhost:16686"

# Prometheus
kubectl port-forward -n istio-system svc/prometheus 9090:9090 
echo "Prometheus (Metrics): http://localhost:9090"
