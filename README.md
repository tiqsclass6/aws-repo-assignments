# ☁️ AWS Weekly Terraform Assignments (Summary)

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![AWS Cloud](https://img.shields.io/badge/AWS-Cloud_Services-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![CloudFront](https://img.shields.io/badge/CloudFront-CDN-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![Amazon S3](https://img.shields.io/badge/Amazon_S3-Private_Origin-569A31?style=for-the-badge&logo=amazonaws&logoColor=white)
![AWS WAF](https://img.shields.io/badge/AWS_WAF-Core_Protections-FF4F8B?style=for-the-badge&logo=amazonaws&logoColor=white)
![Security](https://img.shields.io/badge/Security-TLS_1.3-success?style=for-the-badge)
![Cost](https://img.shields.io/badge/Cost-AWS_Free_Tier-green?style=for-the-badge)
![Automation](https://img.shields.io/badge/Automation-CloudFront_Invalidate-blueviolet?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=blue)
![Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=informational)
![Open Issues](https://img.shields.io/github/issues/tiqsclass6/aws-repo-assignments?style=for-the-badge&color=yellow)
![Status](https://img.shields.io/badge/Status-Active-blue?style=for-the-badge)

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

### 🔹 [`assignment-12092025`](https://github.com/tiqsclass6/aws-repo-assignments/tree/assignment-12092025)

- **Focus:** Secure Static Website Delivery w/CloudFront & S3 (Terraform)

- **Files & Descriptions:**
  - `0-authentication.tf` – Terraform backend configuration and state management
  - `1-providers.tf` – AWS provider configuration, including region and provider aliases
  - `2-variables.tf` – Input variables defining project naming and configuration values
  - `3-s3.tf` – Private S3 bucket configuration, versioning, public access blocking, and static website objects
  - `4-cloudfront.tf` – CloudFront distribution, Origin Access Control (OAC), TLS configuration, custom error responses, and automated cache invalidation logic
  - `5-waf.tf` – AWS WAF Web ACL configuration and association with CloudFront for core security protections
  - `6-outputs.tf` – Exported outputs including CloudFront distribution details
  - `index.html` – Primary static website entry point
  - `error.html` – Custom error page served by CloudFront
  - `Screenshots/` – Deployment evidence, including CloudFront, S3, Terraform workflow, and validation screenshots
  - `website-demo.mp4` – End-to-end video demonstration of the deployed website

- **Outcome:**  
  A production-ready, security-focused static website architecture demonstrating CDN delivery, private origin access, HTTPS enforcement, WAF protections, custom error handling, and infrastructure automation using Terraform.

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
|
assignment-12092025/
├── 0-authentication.tf
├── 1-providers.tf
├── 2-variables.tf
├── 3-s3.tf
├── 4-cloudfront.tf
├── 5-waf.tf
├── 6-outputs.tf
├── index.html
├── error.html
├── Screenshots/
└── website-demo.mp4
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

- **Terraform** – Primary Infrastructure as Code (IaC) tool used to provision, manage, and automate all AWS resources in a declarative and repeatable manner
- **Amazon Web Services (AWS)** – Cloud platform hosting the core services used in this project, including CloudFront, S3, ACM, WAF, and IAM
- **Amazon S3** – Private object storage used to host static website assets (`index.html`, `error.html`)
- **Amazon CloudFront** – Global content delivery network (CDN) used to securely serve static content with HTTPS enforcement and edge caching
- **Origin Access Control (OAC)** – Modern CloudFront security mechanism ensuring the S3 bucket is accessible only through CloudFront
- **AWS Certificate Manager (ACM)** – Manages TLS certificates used by CloudFront to enforce HTTPS with modern TLS policies
- **AWS WAF (Web Application Firewall)** – Provides core web application security protections using managed rule sets
- **AWS Shield Standard** – Default DDoS protection automatically enabled for CloudFront distributions at no additional cost
- **Terraform `terraform_data` Resource** – Modern orchestration mechanism used to trigger CloudFront cache invalidation when website content changes
- **AWS CLI** – Used for CloudFront invalidation commands, verification, and troubleshooting during deployment
- **GitHub Version Control** – Tracks infrastructure changes, branch-based assignments, and commit history
- **GitHub Branching Workflow** – Assignment-based branching model demonstrating incremental infrastructure and security enhancements
- **Markdown Documentation** – Structured project documentation, including README, architecture descriptions, and deployment instructions
- **Shields.io Badges** – Visual indicators highlighting tooling, security posture, automation, and project status
- **HTML/CSS** – Front-end components for the static website served through CloudFront

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
| 9️⃣ | `assignment-12092025` | CloudFront + WAF + Secure S3 Hosting | `0-authentication.tf`, `1-providers.tf`, `2-variables.tf`, `3-s3.tf`, `4-cloudfront.tf`, `5-waf.tf`, `6-outputs.tf`, `index.html`, `error.html` |

> [!NOTE]
> Future branches will add compute, IAM roles, and monitoring components.

---

## 🔎 Troubleshooting

| Issue | Possible Fix |
|-------|--------------|
| **`terraform init` fails** | Verify Terraform version (`>= 1.6`), provider constraints, and backend configuration. If using a remote backend, ensure the S3 bucket exists and credentials are valid. |
| **AWS credential errors** | Ensure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are configured via environment variables, AWS CLI, or an IAM role. Run `aws sts get-caller-identity` to verify access. |
| **ACM certificate not found** | CloudFront certificates **must** exist in `us-east-1`. Verify the certificate status is **ISSUED** and the correct domain name is referenced. |
| **CloudFront distribution stuck in Deploying** | CloudFront updates are global and may take several minutes. Wait for status to change to **Deployed** before testing. |
| **CloudFront returns 403 Access Denied** | Confirm Origin Access Control (OAC) is configured and the S3 bucket policy allows `s3:GetObject` from the CloudFront distribution ARN. |
| **Custom error page not loading** | Ensure `error.html` exists at the **bucket root** and that both **403 and 404** custom error responses are configured in CloudFront. |
| **WAF not attaching to CloudFront** | WAF Web ACLs for CloudFront must be created in `us-east-1`. Verify the `web_acl_id` is set on the distribution. |
| **CloudFront cache not updating after content changes** | Verify the `terraform_data` invalidation resource is triggering correctly and that the AWS CLI is installed and authenticated. |
| **CloudFront invalidation fails** | Ensure correct path formatting (`"/*"`), valid distribution ID, and sufficient IAM permissions for `cloudfront:CreateInvalidation`. |
| **S3 objects not uploading** | Confirm file paths are correct and that `for_each` object definitions reference valid source files. Check `terraform plan` for file diffs. |
| **Website loads over HTTP instead of HTTPS** | Verify CloudFront viewer protocol policy is set to `redirect-to-https` and the ACM certificate is correctly attached. |
| **WAF blocking legitimate traffic** | Review WAF sampled requests and metrics in CloudWatch. Adjust or exclude managed rule sets if necessary. |
| **Terraform state lock issues** | If using a remote backend, ensure no stale locks exist. Retry after a few minutes or manually clear locks if required. |

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
