# 🚀🌍 VPC Peering with Terraform on AWS

[![Terraform Version](https://img.shields.io/badge/Terraform-v1.5.0-blueviolet?style=flat-square&logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS-Provider-orange?style=flat-square&logo=amazon-aws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-yellow?style=flat-square)
![Terraform Files](https://img.shields.io/badge/Code-.tf-623ce4?style=flat-square&logo=terraform)
![Shell Scripts](https://img.shields.io/badge/Scripts-.sh-089e00?style=flat-square&logo=gnu-bash)
![IaC Style](https://img.shields.io/badge/Style-Modules%20%2F%20Layers-blue?style=flat-square)

---

## 📌 Overview

This repository contains a comprehensive set of Terraform configurations designed to deploy secure, cross-region AWS **VPC Peering** in a fully automated and repeatable manner. The project provisions two or more **Virtual Private Clouds (VPCs)** across different AWS regions and establishes a private peering connection between them, **enabling seamless, low-latency communication without exposing traffic to the public internet.** By codifying all networking components—including **subnets, route tables, gateways, security boundaries, and compute resources**—this repository demonstrates best-practice `Infrastructure-as-Code (IaC)` patterns while providing an extensible foundation for **multi-region architectures, distributed applications, hybrid network topologies, and real-world cloud engineering workflows.**

### Deployment Provisions

- `VPCs`, `subnets`, `IGWs`, `NAT gateways`
- `Route tables` and `security groups`
- `EC2 instances`
- Optional regional automation scripts
- A clean, modular Terraform codebase

### Multi‑Region AWS VPC Peering

It supports:

- Cross-region system communication  
- Multi‑VPC architectures  
- Training or demonstration environments  
- Real‑world networking patterns  

---

## 🌐 Architecture Overview

This architecture consists of two independent Amazon VPCs deployed in separate AWS regions, each containing its own **public and private subnets, Internet Gateway, NAT Gateway, route tables, and EC2 instances.** The two VPCs are connected through an AWS **VPC Peering connection**, enabling private, low‑latency communication between workloads running in each region without traversing the public internet. **Public subnets provide ingress and outbound access via IGWs, while private subnets route outbound traffic through NAT Gateways.** `Route tables` in both VPCs are automatically updated to forward inter‑VPC traffic through the peering connection, ensuring seamless cross‑region connectivity for *testing, development, or distributed application deployments.*

![Architecture Diagram](/Screenshots/vpc_peering_diagram.png)

---

## 🗂️ Project Structure

```plaintext
📁 vpc-peering/
├─ 📄 .gitignore                 # Excludes local IaC artifacts.
├─ 🟪 0-authentication.tf        # AWS provider authentication.
├─ 🟪 1-vpc.tf                   # VPC Generation.
├─ 🟪 2-subnets.tf               # Public & private subnet creation.
├─ 🟪 3-igw.tf                   # Internet Gateway resources.
├─ 🟪 4-rtb.tf                   # Route tables + route associations.
├─ 🟪 5-sg.tf                    # Security Groups for EC2 web servers.
├─ 🟪 6-instances.tf             # EC2 instances configured per region.
├─ 🟪 7-backend.tf               # S3 backend configuration.
├─ 🟪 8-output.tf                # Terraform outputs.
├─ 🐚 japan.sh                   # Custom Japan Apache Bash Script.
├─ 📄 README.md                  # Project documentation.
```

### **Legend:**

- 🟪 Terraform (`.tf`)
- 🐚 Shell scripts
- 📄 Generic file
- 📂 Directory

---

## 🚀 Deployment Steps

### 1️⃣ Prerequisites

- **Terraform v1.14.0+**  
- **AWS CLI configured**  

  ```bash
  aws sts get-caller-identity
  ```

- IAM access to VPC, EC2, networking

---

### 2️⃣ Clone Repository

```bash
git clone https://github.com/tiqsclass6/<repo-name>.git
cd <repo-name>
```

---

### 3️⃣ Initialize, Format, and Validate Terraform

```bash
terraform init
terraform fmt -recursive
terraform validate
```

![terraform-init-validate-fmt.jpg](/Screenshots/terraform-init-validate-fmt.jpg)

---

### 4️⃣ Preview Plan

```bash
terraform plan
```

![terraform-plan.jpg](/Screenshots/terraform-plan.jpg)

---

### 5️⃣ Apply Deployment

```bash
terraform apply -auto-approve
```

![terraform-apply.jpg](/Screenshots/terraform-apply.jpg)

---

## 📸 Screenshots

Use real AWS screenshots in your repo.

### VPC Peering Connection

![VPC Peering Screenshot](https://via.placeholder.com/800x400?text=VPC+Peering+Connection)

### EC2 Instances

![EC2 Instances](https://via.placeholder.com/800x400?text=EC2+Instances)

### Route Tables

![Route Tables](https://via.placeholder.com/800x400?text=Route+Tables)

---

## 🛑 Teardown Instructions

### Destroy AWS Resources

```bash
terraform destroy -auto-approve
```

![terraform-destroy.jpg](/Screenshots/terraform-destroy.jpg)

---

## 🛠️ Troubleshooting

### 🔐 Authentication Issues

```bash
aws sts get-caller-identity
```

### 📦 Provider Upgrade

```bash
terraform init -upgrade
```

### ❗ Resource Failures

- Check AWS quotas  
- Investigate CloudTrail logs  
- Validate CIDRs  

### 🌐 Routing Issues

- Ensure peering is **active**
- Verify route tables
- Confirm SG/ACL rules allow traffic

---

## 📚 References

- **AWS VPC Peering:** <https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-routing.html>
- **Terraform AWS Provider:** <https://registry.terraform.io/providers/hashicorp/aws/latest/docs>
- **EC2 Concepts:** <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html>

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S  
- **Group Leader:** John Sweeney  

---
