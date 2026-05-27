# DevOps-AWS-Project

## Project Overview

This project demonstrates a complete GitOps workflow using:

- Terraform
- AWS EKS
- Kubernetes
- ArgoCD
- NGINX Ingress Controller
- GitHub

The infrastructure is provisioned using Terraform, applications are deployed on Kubernetes, and ArgoCD is used to implement GitOps-based continuous deployment.

---

# Architecture Workflow

```text
Developer → GitHub Repository → ArgoCD → Kubernetes Cluster (EKS) → NGINX Application
```

---

# Technologies Used

- AWS EKS
- Terraform
- Kubernetes
- ArgoCD
- NGINX
- GitHub
- AWS Load Balancer

---

# Terraform Infrastructure

The `terraform/` folder contains Terraform code used to provision:

- AWS EKS Cluster
- Managed Node Group
- IAM Roles
- Networking Configuration

---

# Cluster Provisioning Steps

## Initialize Terraform

```bash
terraform init
```

## Review Terraform Plan

```bash
terraform plan
```

## Create EKS Cluster

```bash
terraform apply -auto-approve
```

---

# Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name devops-assignment-cluster
```

## Verify Nodes

```bash
kubectl get nodes
```

### EKS Cluster and Worker Nodes

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20201213.png" width="1000">


<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20204438.png" width="1000">
---

# Kubernetes Manifests

The `manifests/` folder contains:

- NGINX Deployment
- Kubernetes Service

## Deploy Application

```bash
kubectl apply -f manifests/
```

## Verify Pods

```bash
kubectl get pods
```

### Running NGINX Pods

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20203033.png" width="1000">


<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20203131.png" width="1000">
---

# Install ArgoCD

## Create Namespace

```bash
kubectl create namespace argocd
```

## Install ArgoCD

```bash
kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

# ArgoCD Login Instructions

## Port Forward ArgoCD Server

```bash
kubectl port-forward svc/argocd-server -n argocd 9090:443
```

## Get Initial Admin Password

```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
-o jsonpath="{.data.password}" | base64 -d
```

## Access ArgoCD UI

```text
https://127.0.0.1:9090
```

## Default Username

```text
admin
```

### ArgoCD Login Page

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20210611.png" width="1000">

---

# ArgoCD Configuration

The `argocd/` folder contains the ArgoCD Application manifest used for GitOps synchronization.

## Create ArgoCD Application

```bash
kubectl apply -f argocd/application.yaml
```

## Verify Application

```bash
kubectl get applications -n argocd
```

### ArgoCD Application Synced Successfully

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20215244.png" width="1000">


---

# Ingress Configuration

NGINX Ingress Controller was deployed using AWS LoadBalancer service to expose the application publicly.

## Deploy Ingress Resource

```bash
kubectl apply -f ingress/ingress.yaml
```

## Verify Ingress

```bash
kubectl get ingress
```

### Ingress Resource

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20221804.png" width="1000">

---

# Access NGINX Application

## Example Ingress URL

```text
http://a83512bccbb024d739c8210fe09118d2-1132929605.ap-south-1.elb.amazonaws.com
```

### NGINX Application Running Successfully

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20221824.png" width="1000">

---

# GitOps Workflow Demonstration

Updated deployment replicas from:

```yaml
replicas: 2
```

to

```yaml
replicas: 3
```

Changes were pushed to GitHub repository and ArgoCD automatically synchronized the Kubernetes cluster.

### GitOps Synchronization Demonstration

<img src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20215256.png" width="1000">

---

# Repository Structure

```text
devops-assignment/
├── terraform/
├── manifests/
├── argocd/
├── ingress/
├── screenshots/
└── README.md
```

---

# Screenshots Included

- EKS Cluster Creation
- Kubernetes Nodes
- Running Pods
- ArgoCD Login
- ArgoCD Application Sync
- Ingress Configuration
- NGINX Application Access
- GitOps Synchronization

---

# Author

Tushar Gadgade
