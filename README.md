# DevOps GitOps Assignment using Terraform, EKS, Kubernetes and ArgoCD

## Project Overview

This project demonstrates a complete GitOps-based Kubernetes deployment workflow using:

- Terraform for Infrastructure as Code
- AWS EKS for Kubernetes Cluster
- Kubernetes manifests for NGINX deployment
- ArgoCD for GitOps Continuous Deployment
- NGINX Ingress Controller for external access

---

# Project Structure

devops-assignment/
│
├── terraform/      # EKS Infrastructure Code
├── manifests/      # Kubernetes Deployment & Service
├── argocd/         # ArgoCD Application YAML
├── ingress/        # Ingress Configuration
└── README.md


# Technologies Used

- AWS EKS
- Terraform
- Kubernetes
- ArgoCD
- NGINX
- GitHub


# Step 1: Provision EKS Cluster

cd terraform

terraform init
terraform plan
terraform apply -auto-approve


## EKS Cluster Created

<img width="1000" alt="eks cluster" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20201213.png">


<img width="1000" alt="eks cluster" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20203033.png">


<img width="1000" alt="eks cluster" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20203131.png">
---

# Step 2: Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name devops-assignment-cluster
```

## kubectl get nodes

<img width="1000" alt="kubectl nodes" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20204438.png">

---

# Step 3: Deploy NGINX Application

```bash
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml
```


# Step 4: Install and Configure ArgoCD

```bash
kubectl create namespace argocd

kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

# Step 5: Create ArgoCD Application

```bash
kubectl apply -f argocd/application.yaml
```

## ArgoCD Application Synced

<img width="1000" alt="argocd synced" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20215244.png">


<img width="1000" alt="argocd synced" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20215256.png">
---

# Step 6: Configure Ingress

```bash
kubectl apply -f ingress/ingress.yaml
```

## Public NGINX Access using Ingress

<img width="1000" alt="public nginx" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20221824.png">



<img width="1000" alt="public nginx" src="https://github.com/TKG27/devops-assignment/blob/main/screenshots/Screenshot%202026-05-08%20221804.png">

---

# GitOps Demonstration

Updated deployment replicas from 2 to 3 and pushed changes to GitHub.

ArgoCD automatically synchronized the changes to the Kubernetes cluster.

---



# Author

Tushar Gadgade  
