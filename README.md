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

![diagram.png](diagram.png)

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

### 🔹 [`assignment-10282025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-10282025)

- **Focus:** Advanced Route Table Expansion + Multi-AZ Public/Private Routing  
- **Includes:**
  - `6-SG-All.tf` — Defines all project Security Groups, including ingress/egress rules for EC2, ALB, SSH, and application traffic  
  - `7-instances.tf` — Creates a standard EC2 instance for testing network reachability, SG behavior, and future ALB/ASG integration  
- **Outcome:**  
  This branch extends the network layer by adding Security Groups and initial EC2 resources, ensuring the project has **secured routing, controlled traffic paths, and testable compute infrastructure** for the next stages.

---

### 🔹 [`assignment-11042025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-11042025)

- **Focus:** Security hardening + IAM role expansion  
- **Includes:**
  - `B. outputs.tf` — Adds outputs for Target Group ARNs and related identifiers, enabling downstream consumption by the Load Balancer and Autoscaling branches  
- **Outcome:**  
  This branch introduces foundational **output exports** used by later compute components, ensuring that Target Groups and other load-balancing resources are easily consumable and referenceable throughout the infrastructure.

---

### 🔹 [`assignment-11112025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-11112025)

- **Focus:** Compute preparation + key management  
- **Includes:**
  - `8-target-groups.tf` — Creates ALB Target Groups for routing traffic to EC2 instances or autoscaling groups  
  - `9-load-balancer.tf` — Provisions an Application Load Balancer (ALB), listeners, and listener rules  
  - `10-autoscaling-policy.tf` — Defines scaling policies (CPU, request count, step scaling, predictive scaling) for dynamic capacity management  
  - `11-launch-template.tf` — Configures an AWS Launch Template with AMI, instance type, SGs, user data, and tagging for ASG usage  
- **Outcome:**  
  This branch introduces the **core Compute Layer**, enabling scalable EC2 infrastructure behind an ALB—with key components such as Target Groups, Launch Templates, and Autoscaling Policies fully implemented.

---

### 🔹 [`assignment-11182025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-11182025)

- **Focus:** Monitoring + Alerting + Observability
- **Includes:**
  - `venezuela.sh` — Bash S
- **Outcome:**
Establishes the Monitoring & Alerting Layer, providing real-time visibility, proactive notifications, and scaling behaviors driven by production-grade metrics.

---

## 🗂️ Repository Tree

```bash
assignment-10142025/
├── .gitignore
├── 0-authentication.tf
├── 1-vpc.tf
├── 2-subnets.tf
├── A-backend.tf
├
assignment-10212025/
├── 3-igw.tf
├── 4-nat.tf
├── 5-rtb.tf
├
assignment-10282025/
├── 6-SG-All.tf
├── 7-instances.tf
├
assignment-11042025/
├── B. outputs.tf
├
assignment-11112025/
├── 8-target-groups.tf
├── 9-load-balancer.tf
├── 10-autoscaling-policy.tf
├── 11-launch-template.tf
├
assignment-11182025/
├── venezuela.sh
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/tiqsclass6/aws-repo-assignments
cd aws-repo-assignments
git checkout <branch-name>
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve
```

> [!NOTE]
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
| 2️⃣ | `assignment-10212025` | IGW + NAT + Basic Routing | `3-igw.tf`, `4-nat.tf`, `5-rtb.tf` |
| 3️⃣ | `assignment-10282025` | Security Groups + EC2 Instance | `6-SG-All.tf`, `7-instances.tf` |
| 4️⃣ | `assignment-11042025` | Security + IAM Expansion | `B. outputs.tf` |
| 5️⃣ | `assignment-11112025` | Compute + Load Balancer + Autoscaling | `8-target-groups.tf`, `9-load-balancer.tf`, `10-autoscaling-policy.tf`, `11-launch-template.tf` |
| 6️⃣ | `assignment-11182025` | Monitoring + Alerting | `venezuela.sh` |

> [!NOTE]
> Future branches will add compute, IAM roles, and monitoring components.

---

## 🔎 Troubleshooting

| Issue | Possible Fix |
|-------|---------------|
| **Terraform init fails** | Verify your S3 backend or disable the remote backend block. |
| **Credential errors** | Ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are configured. |
| **NAT Gateway not deploying** | Check subnet associations and elastic IP configurations. |
| **Route Table not linking** | Validate subnet-to-route-table associations and IGW IDs. |
| **ALB not provisioning** | Confirm security group rules and target group health checks. |
| **Autoscaling issues** | Review scaling policies and CloudWatch metrics for triggers. |
| **Monitoring scripts fail** | Ensure AWS CLI is configured and permissions are correct. |
| **State file conflicts** | Use `terraform state` commands to inspect and resolve issues. |

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
