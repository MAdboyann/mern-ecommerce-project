#!/bin/bash

set -e

CLUSTER_NAME="mern-app"
REGION="us-east-1"

echo "🔄 Updating kubeconfig..."
aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME

echo "⏳ Waiting for nodes to be Ready..."
kubectl wait --for=condition=Ready nodes --all --timeout=180s

echo "📦 Adding Helm repositories..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "🚀 Installing NGINX Ingress Controller..."
helm upgrade --install nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=LoadBalancer \
  --wait --timeout 10m

echo "📁 Creating monitoring namespace..."
kubectl create namespace monitoring || true

echo "🚀 Installing Prometheus + Grafana..."
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  -f ../helm/monitoring-values.yml \
  --wait --timeout 15m

echo "🔍 Checking resources..."
kubectl get pods -n ingress-nginx
kubectl get pods -n monitoring

echo "🌐 Getting Ingress External IP..."
kubectl get svc -n ingress-nginx

echo "✅ Setup completed successfully 🚀"