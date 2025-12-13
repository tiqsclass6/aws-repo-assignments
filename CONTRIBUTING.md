# 🔐 Security Policy

## 🗂️ Supported Versions

| Branch | Supported |
|-------|-----------|
| `assignment-12092025` (latest) | ✅ Supported |
| Older assignment branches | ⚠️ Security updates may not be applied |

Only the most recent assignment branch receives active security updates and improvements.

---

## 🛡️ Reporting a Vulnerability

If you discover a security vulnerability, please **do not open a public GitHub issue**.

Instead, report it privately using one of the following methods:

- **Maintainer: T.I.Q.S.**  
- **GitHub:** <https://github.com/tiqsclass6>  

When reporting a vulnerability, please include:

- A clear description of the issue
- Steps to reproduce (if applicable)
- Potential impact or exploitation scenarios
- Any relevant logs, screenshots, or configuration snippets

Responsible disclosure is appreciated.

---

## 🚧 Security Practices

This repository follows modern cloud security best practices, including:

- **No hardcoded secrets**  
  AWS credentials, API keys, and sensitive values must never be committed to the repository.

- **Secure credential handling**  
  Use environment variables, AWS CLI profiles, or IAM roles for authentication.

- **Infrastructure as Code security**  
  Terraform configurations should:
  - Avoid public S3 access
  - Enforce HTTPS via CloudFront and ACM
  - Use Origin Access Control (OAC) for private S3 origins
  - Apply least-privilege IAM permissions

- **State protection**  
  Terraform state should be stored securely using encrypted backends (e.g., S3 with encryption and optional DynamoDB locking).

- **Web application protection**  
  AWS WAF managed rule sets are used to provide baseline protection against common web threats.

---

## 🔍 Recommended Security Tooling

The following tools are recommended when developing or extending this project:

- **Terraform State Security**
  - Encrypted S3 remote backends
  - Optional DynamoDB state locking

- **AWS Native Security Services**
  - AWS WAF (Web Application Firewall)
  - AWS Shield Standard (automatic with CloudFront)
  - AWS CloudTrail (API activity auditing)
  - Amazon CloudWatch (metrics and alerting)

- **Infrastructure Security Scanning**
  - `tfsec`
  - `Checkov`
  - `Snyk Infrastructure as Code`

---

## 📌 Notes

- This project intentionally does **not** enable AWS Shield Advanced due to its monthly cost and account-level requirements.
- Security configurations are designed to be **cost-aware**, **free-tier friendly**, and **production-aligned** where possible.

---

## ✍️ Maintainer

**T.I.Q.S.**  
GitHub: <https://github.com/tiqsclass6>
