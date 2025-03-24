# 📌 EKS Monitoring with Terraform

## 📖 Overview

This repository provides an automated solution for **monitoring an Amazon EKS cluster** using **Terraform, Prometheus, Grafana, and Alertmanager**.  
It includes:  
- **Terraform Infrastructure as Code (IaC)**
- **Prometheus for Metrics Collection**
- **Grafana for Data Visualization**
- **Alertmanager for Notifications**
- **Predefined Alerting Rules for Node & Pod Health**

---

## 🏗️ Architecture Diagram

The following architecture outlines **EKS monitoring** using Terraform and Prometheus:

```plaintext
                           +-----------------------------------+
                           |        AWS EKS Cluster          |
                           |---------------------------------|
                           | +---------------------------+  |
                           | |       Application Pods    |  |
                           | +---------------------------+  |
                           |         |        |             |
                           |         v        v             |
                           | +---------------------------+  |
                           | |   Kubernetes Metrics      |  |
                           | +---------------------------+  |
                           |         |        |             |
                           |         v        v             |
                           | +---------------------------+  |
                           | |      Prometheus Server    |  |
                           | +---------------------------+  |
                           |         |        |             |
                           |         v        v             |
                           | +---------------------------+  |
                           | |          Grafana          |  |
                           | +---------------------------+  |
                           |         |        |             |
                           |         v        v             |
                           | +---------------------------+  |
                           | |       Alertmanager        |  |
                           | +---------------------------+  |
                           +---------------------------------+
