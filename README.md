# ☁️ AWS Weekly Terraform Assignments (Summary)

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![AWS Cloud](https://img.shields.io/badge/AWS-Cloud_Services-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![S3 Hosting](https://img.shields.io/badge/S3-Static_Website_Hosting-569A31?style=for-the-badge&logo=amazonaws&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=blue)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=informational)
![Open Issues](https://img.shields.io/github/issues/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=yellow)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen?style=for-the-badge)
![Made with Terraform](https://img.shields.io/badge/Made_with-Terraform-5F43E9?style=for-the-badge&logo=terraform&logoColor=white)
![Project Status](https://img.shields.io/badge/Status-Active-blue?style=for-the-badge)

This repository contains a series of **modular AWS Terraform assignments** designed to progressively build a secure, scalable, and production-ready cloud environment.  
Each **branch** represents a weekly milestone, beginning with core authentication and backend state configuration, then expanding into VPC architecture, subnets, gateways, routing, NAT services, and security layers.

Over time, the assignments assemble a complete **AWS network foundation** capable of supporting compute workloads, load balancers, autoscaling, monitoring, SNS alerting, and S3 static website deployments—fully managed through Infrastructure as Code.

---

## 📊 Architecture Diagram

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
  - `venezuela.sh` — Custom Apache script that caters for Venezuela.
- **Outcome:**
Establishes the Monitoring & Alerting Layer, providing real-time visibility, proactive notifications, and scaling behaviors driven by production-grade metrics.

---

### 🔹 [`assignment-11252025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-11252025)

- **Focus:** Simple Notification Service (SNS) Integration  
- **Includes:**
  - `12-sns.tf` — Configures SNS topics, subscriptions, and IAM roles for alerting DevOps teams.
- **Outcome:**  
  This branch adds **notification capabilities** to the monitoring setup, enabling automated alerts via SNS for critical infrastructure events and thresholds. It also enhances the observability framework established in the previous branch.

---

### 🔹 [`assignment-12022025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-12022025)

- **Focus:** Static Website Hosting + S3 Deployment Using Terraform  
- **Includes:**
  - `0-auth.tf` — Authentication + AWS IAM credentials configuration  
  - `1-providers.tf` — AWS provider setup and global Terraform settings  
  - `2-s3.tf` — S3 bucket creation, website hosting configuration, and public access settings  
  - `3-outputs.tf` — Exposes S3 website endpoint and bucket details  
  - `A-index.html` — Main Argentina-themed animated landing page  
  - `B-wifey.html` — Secondary HTML content page (linked in website or used as error page)

- **Outcome:**  
  This branch delivers a **fully functional static website** hosted on an AWS S3 bucket using Terraform.  
  It includes all Terraform IaC components required to build and deploy the site, plus two custom HTML pages styled and animated for the Argentina-themed project.

---

## 🗂️ Repository Tree

```plaintext
assignment-10142025/
├── .gitignore
├── 0-authentication.tf
├── 1-vpc.tf
├── 2-subnets.tf
├── A-backend.tf
|
assignment-10212025/
├── 3-igw.tf
├── 4-nat.tf
├── 5-rtb.tf
|
assignment-10282025/
├── 6-SG-All.tf
├── 7-instances.tf
|
assignment-11042025/
├── B-outputs.tf
|
assignment-11112025/
├── 8-target-groups.tf
├── 9-load-balancer.tf
├── 10-autoscaling-policy.tf
├── 11-launch-template.tf
|
assignment-11182025/
├── venezuela.sh
|
assignment-11252025/
├── 12-sns.tf
|
assignment-12022025/
├── 0-auth.tf
├── 1-providers.tf
├── 2-s3.tf
├── 3-outputs.tf
├── A-index.html
├── B-wifey.html
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

- **Terraform** – Primary IaC tool used to provision all AWS resources across assignments
- **Amazon Web Services (AWS)** – VPC, Subnets, Internet Gateway, NAT Gateway, Route Tables, Security Groups, EC2, ALB, Auto Scaling, S3 Static Hosting
- **S3 Bucket Ownership Controls** – Modern ACL-less static hosting configuration
- **Remote State Backend** – Optional S3 + DynamoDB Terraform state locking (`A-backend.tf`)
- **GitHub Branching Workflow** – Weekly assignment branches showing infrastructure progression from networking → compute → load balancing → scaling → S3 hosting
- **GitHub Version Control** – Tracks code evolution, diffs, and commit history
- **Markdown Documentation** – Clean, structured summaries of each assignment
- **Shields.io Badges** – Visual repository indicators (Terraform, AWS, status, size, last commit)
- **AWS CLI & Management Console** – Verification, bucket inspection, S3 uploads, and troubleshooting
- **HTML/CSS** – Front-end components for S3-based static website (Argentina-themed UI)

---

## ⚙️ Learning Progression

| Week | Branch | Focus | Key Files |
|------|---------|--------|-----------|
| 1️⃣ | `assignment-10142025` | Base VPC + Auth + Backend | `0-authentication.tf`, `1-vpc.tf`, `2-subnets.tf`, `A-backend.tf` |
| 2️⃣ | `assignment-10212025` | IGW + NAT + Basic Routing | `3-igw.tf`, `4-nat.tf`, `5-rtb.tf` |
| 3️⃣ | `assignment-10282025` | Security Groups + EC2 Instance | `6-SG-All.tf`, `7-instances.tf` |
| 4️⃣ | `assignment-11042025` | Security + IAM Expansion | `B-outputs.tf` |
| 5️⃣ | `assignment-11112025` | Compute + Load Balancer + Autoscaling | `8-target-groups.tf`, `9-load-balancer.tf`, `10-autoscaling-policy.tf`, `11-launch-template.tf` |
| 6️⃣ | `assignment-11182025` | Monitoring + Alerting Script | `venezuela.sh` |
| 7️⃣ | `assignment-11252025` | AWS SNS Notifications | `12-sns.tf` |
| 8️⃣ | `assignment-12022025` | Full S3 Website Deployment + HTML Content | `0-auth.tf`, `1-providers.tf`, `2-s3.tf`, `3-outputs.tf`, `A-index.html`, `B-wifey.html` |

> [!NOTE]
> Future branches will add compute, IAM roles, and monitoring components.

---

## 🔎 Troubleshooting

| Issue | Possible Fix |
|-------|--------------|
| **Terraform init fails** | Verify S3 backend configuration or temporarily disable the remote backend. |
| **AWS credential errors** | Ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are exported or configured via AWS CLI. |
| **NAT Gateway not deploying** | Check subnet mapping, route table associations, and confirm EIP availability. |
| **Route Table not linking** | Validate IGW/NAT IDs and ensure correct subnet associations. |
| **ALB not provisioning** | Confirm SG inbound rules, target group health checks, and subnet selection. |
| **Autoscaling issues** | Review CloudWatch alarms, scaling policies, instance role permissions. |
| **Monitoring script errors** | Ensure AWS CLI v2 is installed and IAM permissions allow required actions. |
| **State file conflicts** | Run `terraform state list`, `terraform state rm`, or repair backend locks in DynamoDB. |
| **SNS emails not received** | Confirm subscription is **confirmed**, check spam folder, and verify email endpoint. |
| **S3 website not loading** | Verify `BucketOwnerEnforced`, remove unsupported ACLs, and confirm bucket policy allows `s3:GetObject`. |
| **HTML objects not uploading** | Remove `acl = "public-read"` (unsupported with Bucket Owner Enforced); rely on bucket policy instead. |
| **Website URL returns 403** | Ensure index file key matches (`index.html`) and that the bucket policy allows public read. |

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
