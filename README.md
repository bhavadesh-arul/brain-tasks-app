PROJECT SCREENSHOT [LINK CLICK HERE](https://docs.google.com/document/d/14mGZ6wIL1w-65zg7JCg1EDMCXotmswnuzcWedoRy2dQ/edit?usp=sharing) 

# 🚀 Brain Tasks App — CI/CD Deployment on AWS EKS

This project demonstrates a **real-world CI/CD pipeline** that automatically builds, pushes, and deploys a containerized web application to **Amazon EKS** using **AWS CodePipeline and CodeBuild**.

A simple **Git push to the main branch** triggers the entire deployment flow — no manual Docker, no manual ECR push, and no manual `kubectl apply`.

---

## 📌 Project Overview

**Brain Tasks App** is a containerized task management web application deployed on Kubernetes (EKS) with a fully automated CI/CD pipeline.

### Key Highlights

* Automated build and deployment on Git push
* Docker image built and pushed to Amazon ECR
* Kubernetes deployment updated automatically
* Zero manual intervention after code commit

---

## 🧱 Architecture

```
GitHub (main branch)
      ↓
AWS CodePipeline
      ↓
AWS CodeBuild
      ├── Docker build
      ├── Docker tag
      ├── Docker push to Amazon ECR
      ├── aws eks update-kubeconfig
      └── kubectl apply (Deployment & Service)
      ↓
Amazon EKS
      ↓
Application exposed via LoadBalancer
```

---

## 🛠️ Tech Stack

| Category                  | Tools                           |
| ------------------------- | ------------------------------- |
| Version Control           | GitHub                          |
| CI/CD                     | AWS CodePipeline, AWS CodeBuild |
| Containerization          | Docker                          |
| Container Registry        | Amazon ECR                      |
| Orchestration             | Amazon EKS (Kubernetes)         |
| Infrastructure Monitoring | Amazon CloudWatch               |
| Application               | HTML / CSS / JavaScript         |

---

## 📁 Repository Structure

```
brain-tasks-app/
│
├── dist/
│   ├── index.html
│   └── assets/
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── Dockerfile
├── buildspec.yml
└── README.md
```

---

## ⚙️ CI/CD Pipeline Workflow

### 1️⃣ Source Stage

* GitHub repository connected via **GitHub App**
* Any push to the `main` branch triggers the pipeline automatically

### 2️⃣ Build & Deploy Stage (CodeBuild)

CodeBuild performs the following actions:

* Logs into Amazon ECR
* Builds Docker image
* Tags image with commit hash and `latest`
* Pushes image to Amazon ECR
* Updates kubeconfig for EKS cluster
* Applies Kubernetes manifests using `kubectl`

---

## 🧾 buildspec.yml (Core CI/CD Logic)

Key actions performed inside CodeBuild:

* `docker build`
* `docker push`
* `aws eks update-kubeconfig`
* `kubectl apply -f k8s/deployment.yaml`
* `kubectl apply -f k8s/service.yaml`

This enables **true continuous deployment**.

---

## ☸️ Kubernetes Deployment

* **Deployment:** `brain-tasks-deployment`
* **Replicas:** 2
* **Service Type:** LoadBalancer
* **Container Port:** 80

On every successful pipeline execution:

* Old pods are terminated
* New pods are created with the updated image
* Zero-downtime rollout is achieved

---

## 🌐 Application Access

The application is exposed via an **AWS LoadBalancer service**.

After deployment, access the app using:

```
http://<ELB-DNS-NAME>
```

Example UI confirmation text used for CI/CD validation:

```
CI/CD TEST v2 – DEPLOYED FROM PIPELINE
```

---

## 📊 Monitoring & Logs

Monitoring is handled using **Amazon CloudWatch**:

* CodePipeline execution status
* CodeBuild build and deployment logs
* Docker build and push logs
* Kubernetes deployment commands output

This provides full visibility into the CI/CD process.

---

## 🚫 Why AWS CodeDeploy Is Not Used

AWS CodeDeploy is **not required** for Kubernetes-based deployments.

Instead, deployments are managed directly using `kubectl` inside CodeBuild, which aligns with **industry best practices for CI/CD on Amazon EKS**.

---

## ✅ CI/CD Validation Proof

The pipeline is considered **successfully implemented** because:

* Git push automatically triggers pipeline
* Docker image is rebuilt and pushed automatically
* Kubernetes pods are replaced automatically
* Application UI reflects new changes without manual steps

---

## 🎯 Conclusion

This project implements a **production-style CI/CD pipeline** for Kubernetes using AWS-native services.
It demonstrates practical DevOps skills including containerization, orchestration, automation, and monitoring.

---

## 👤 Author

**Bhavadesh A**
DevOps | AWS | Docker | Kubernetes
