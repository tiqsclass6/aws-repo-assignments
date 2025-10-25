# ☁️ AWS Weekly Terraform Assignments (Summary)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazonaws&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/aws-repo-assignments)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/aws-repo-assignments)
![Open Issues](https://img.shields.io/github/issues/tiqsclass6/aws-repo-assignments)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)
![Made with Terraform](https://img.shields.io/badge/Made%20with-Terraform-5F43E9?logo=terraform)
![Status](https://img.shields.io/badge/Status-Active-blue)

This repository contains **modular AWS Terraform assignments** for progressively building a secure and scalable cloud infrastructure.  
Each **branch** represents a milestone in the weekly build sequence—starting from foundational authentication and backend setup, expanding through VPC creation, subnets, gateways, routing, and NAT configuration.

The final objective is to achieve a **production-ready AWS network foundation** suitable for deploying compute resources, load balancers, and managed infrastructure components.

---

## 📌 Branch Breakdown

### 🔹 [`assignment-10142025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-10142025)

- **Focus:** Initial AWS environment bootstrap
- **Includes:**
  - Terraform authentication setup (`0-authentication.tf`)
  - VPC creation (`1-vpc.tf`)
  - Subnet definitions (`2-subnets.tf`)
  - Remote backend configuration (`A-backend.tf`)

---

### 🔹 [`assignment-10212025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-10212025)

- **Focus:** Networking expansion and routing logic
- **Includes:**
  - `.gitignore` for Terraform and state exclusions
  - Internet Gateway (`3-igw.tf`)
  - NAT Gateway (`4-nat.tf`)
  - Route Tables and associations (`5-rtb.tf`)
  - Complete VPC foundation for hybrid and public workloads

---

## 🗂️ Repository Tree

```bash
assignment-10212025/
└── .gitignore
├── 0-authentication.tf
├── 1-vpc.tf
├── 2-subnets.tf
├── 3-igw.tf
├── 4-nat.tf
├── 5-rtb.tf
├── A-backend.tf
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/tiqsclass6/aws-repo-assignments
cd aws-repo-assignments
git checkout <branch-name>
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
```

> Replace `<branch-name>` with one of the branch names above.

---

## 🧰 Tools Used

- **Terraform** – Infrastructure as Code (IaC) automation for AWS
- **Amazon Web Services (AWS)** – VPC, Subnets, Internet Gateway, NAT, Route Tables
- **Remote State** – Optional S3 backend with DynamoDB locking (`A-backend.tf`)
- **GitHub Branching** – Progressive weekly infrastructure expansion
- **Markdown Documentation** – Structured assignment summaries
- **Shields.io** – Dynamic repository badges for visualization
- **AWS CLI / Console** – Optional for verification and screenshots

---

## ⚙️ Learning Progression

| Week | Branch | Focus | Key Files |
|------|---------|--------|-----------|
| 1️⃣ | `assignment-10142025` | Base VPC + Auth + Backend | `0-authentication.tf`, `1-vpc.tf`, `2-subnets.tf`, `A-backend.tf` |
| 2️⃣ | `assignment-10212025` | IGW + NAT + Routing | `3-igw.tf`, `4-nat.tf`, `5-rtb.tf` |

> Future branches will add compute, IAM roles, and monitoring components.

---

## 🔎 Troubleshooting

| Issue | Possible Fix |
|-------|---------------|
| **Terraform init fails** | Verify your S3 backend or disable the remote backend block. |
| **Credential errors** | Ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are configured. |
| **NAT Gateway not deploying** | Check subnet associations and elastic IP configurations. |
| **Route Table not linking** | Validate subnet-to-route-table associations and IGW IDs. |

---

## 🤝 Contributing

**Stored in the [CONTRIBUTING.md](CONTRIBUTING.md) file**

1. Fork the repository  
2. Create a feature branch — `git checkout -b feature/new-feature`  
3. Commit changes — `git commit -m "Add new feature"`  
4. Push branch — `git push origin feature/new-feature`  
5. Submit a Pull Request 🎯

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE.txt) file for details.

---

## 👨‍💻 Author & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney

---
