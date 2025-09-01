# Brain-Tasks-App Deployment Project

## Project Overview

This project demonstrates the deployment of a React application to a production-ready environment using Docker, Jenkins, AWS EKS, and CloudWatch for monitoring. The application is containerized and deployed to an EKS cluster with CI/CD automation via CodeDeploy.

## Features

* React frontend running on port 80
* Dockerized for container management
* Jenkins CI/CD pipeline for automated builds and deployments
* AWS EKS for scalable Kubernetes deployment
* CloudWatch logs integration for monitoring application and cluster activity

## Prerequisites

* AWS CLI configured
* Kubernetes CLI (kubectl)
* Docker installed
* Jenkins server with access to GitHub repository
* AWS EKS cluster setup

## Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/Deepak-r-2001/Brain-Tasks-App.git
cd Brain-Tasks-App
```

### 2. Docker Build and Push

```bash
docker build -t deepwhoo/brain-tasks-app:latest .
docker push deepwhoo/brain-tasks-app:latest
```

### 3. Kubernetes Deployment

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl rollout status deployment brain-tasks-deployment
kubectl get pods
```

### 4. Enable CloudWatch Logs for Monitoring

```bash
kubectl create namespace amazon-cloudwatch
kubectl apply -f cwagent-fluent-bit.yaml
kubectl get pods -n amazon-cloudwatch
```

### 5. Jenkins CI/CD Pipeline

* Set up Jenkins pipeline with GitHub repo integration
* Configure build steps:

  * Build Docker image
  * Push to DockerHub
  * Deploy to EKS using kubectl or CodeDeploy
* Enable CloudWatch logs tracking for monitoring

## Verification

* Verify pods are running: `kubectl get pods`
* Check CloudWatch logs for application logs and metrics
* Access application via LoadBalancer URL

## Repository

[GitHub Repository](https://github.com/Deepak-r-2001/Brain-Tasks-App)

## Monitoring

* CloudWatch logs show build, deploy, and application logs
* Visualization can be added to CloudWatch dashboard
