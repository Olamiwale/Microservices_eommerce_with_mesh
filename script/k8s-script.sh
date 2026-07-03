echo "setting up k8s manifest...."


ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Base directories
mkdir -p "$ROOT_DIR/k8s/namespaces"
mkdir -p "$ROOT_DIR/k8s/services"
mkdir -p "$ROOT_DIR/k8s/ingress"
mkdir -p "$ROOT_DIR/k8s/configmaps"

# Namespace
touch "$ROOT_DIR/k8s/namespaces/namespaces.yaml"

# Services
services=(
  product-service
  cart-service
  order-service
  payment-service
  user-service
  inventory-service
  shipping-service
  notification-service
)

for service in "${services[@]}"; do
    mkdir -p "$ROOT_DIR/k8s/services/$service"

    touch "$ROOT_DIR/k8s/services/$service/deployment.yaml"
    touch "$ROOT_DIR/k8s/services/$service/service.yaml"
    touch "$ROOT_DIR/k8s/services/$service/hpa.yaml"
done

# Ingress
touch "$ROOT_DIR/k8s/ingress/ingress.yaml"

# ConfigMap
touch "$ROOT_DIR/k8s/configmaps/configmap.yaml"

echo "Kubernetes manifests created successfully."







#kustomize


# echo "Setting up Kubernetes Kustomize manifests..."

# ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# mkdir -p "$ROOT_DIR/k8s"

# # Base
# mkdir -p "$ROOT_DIR/k8s/base"
# touch "$ROOT_DIR/k8s/base/deployment.yaml"
# touch "$ROOT_DIR/k8s/base/service.yaml"
# touch "$ROOT_DIR/k8s/base/hpa.yaml"
# touch "$ROOT_DIR/k8s/base/kustomization.yaml"

# # Overlays
# mkdir -p "$ROOT_DIR/k8s/overlays"

# # Development
# mkdir -p "$ROOT_DIR/k8s/overlays/dev"
# touch "$ROOT_DIR/k8s/overlays/dev/kustomization.yaml"

# # Staging
# mkdir -p "$ROOT_DIR/k8s/overlays/staging"
# touch "$ROOT_DIR/k8s/overlays/staging/kustomization.yaml"

# # Production
# mkdir -p "$ROOT_DIR/k8s/overlays/prod"
# touch "$ROOT_DIR/k8s/overlays/prod/kustomization.yaml"

# echo "Kustomize manifest structure created successfully."









# ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# mkdir -p "$ROOT_DIR/k8s"

# # Namespace
# mkdir -p "$ROOT_DIR/k8s/namespaces"
# touch "$ROOT_DIR/k8s/namespaces/namespaces.yaml"

# # Product Service
# mkdir -p "$ROOT_DIR/k8s/services/product-service"
# touch "$ROOT_DIR/k8s/services/product-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/product-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/product-service/hpa.yaml"

# # Cart Service
# mkdir -p "$ROOT_DIR/k8s/services/cart-service"
# touch "$ROOT_DIR/k8s/services/cart-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/cart-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/cart-service/hpa.yaml"

# # Order Service
# mkdir -p "$ROOT_DIR/k8s/services/order-service"
# touch "$ROOT_DIR/k8s/services/order-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/order-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/order-service/hpa.yaml"

# # Payment Service
# mkdir -p "$ROOT_DIR/k8s/services/payment-service"
# touch "$ROOT_DIR/k8s/services/payment-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/payment-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/payment-service/hpa.yaml"

# # User Service
# mkdir -p "$ROOT_DIR/k8s/services/user-service"
# touch "$ROOT_DIR/k8s/services/user-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/user-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/user-service/hpa.yaml"

# # Inventory Service
# mkdir -p "$ROOT_DIR/k8s/services/inventory-service"
# touch "$ROOT_DIR/k8s/services/inventory-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/inventory-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/inventory-service/hpa.yaml"

# # Shipping Service
# mkdir -p "$ROOT_DIR/k8s/services/shipping-service"
# touch "$ROOT_DIR/k8s/services/shipping-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/shipping-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/shipping-service/hpa.yaml"

# # Notification Service
# mkdir -p "$ROOT_DIR/k8s/services/notification-service"
# touch "$ROOT_DIR/k8s/services/notification-service/deployment.yaml"
# touch "$ROOT_DIR/k8s/services/notification-service/service.yaml"
# touch "$ROOT_DIR/k8s/services/notification-service/hpa.yaml"

# # Ingress
# mkdir -p "$ROOT_DIR/k8s/ingress"
# touch "$ROOT_DIR/k8s/ingress/ingress.yaml"

# # ConfigMap
# mkdir -p "$ROOT_DIR/k8s/configmaps"
# touch "$ROOT_DIR/k8s/configmaps/configmap.yaml"

echo "Kubernetes manifests created successfully."



