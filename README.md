# 🚀 Terraform AWS EC2 Automation Project

## 📌 Overview
This project provisions and manages AWS infrastructure using Terraform. It automates the deployment of an EC2 instance with Nginx installed and accessible via a static Elastic IP.

---

## 🧰 Tools & Technologies
- Terraform
- AWS EC2
- AWS S3 (Remote State)
- AWS DynamoDB (State Locking)
- Nginx
- GitHub

---

## ⚙️ Features
- Infrastructure as Code using Terraform
- EC2 instance provisioning
- Custom Security Group (SSH & HTTP access)
- Automated Nginx installation using user_data
- Elastic IP for static public access
- Remote state management using S3
- State locking using DynamoDB
- Use of variables and tfvars for flexibility

---

## 📁 Project Structure
|
|--------main.tf
|--------variables.tf
|--------terraform.tfvars
|--------outputs.tf
|--------README.md



---

## 🚀 How to Run

1. Initialize Terraform
```bash
terraform init
```
2. Plan Terraform
```bash
terraform plan
```
3. Apply Terraform
```bash
terraform apply -auto-approve
```
