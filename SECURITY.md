# 🔐 Security Policy

## Supported Versions

| Version | Supported          |
|----------|--------------------|
| Latest branch (`assignment-10212025`) | ✅ Supported |
| Older branches | ⚠️ Security updates may not be applied |

---

## 🛡️ Reporting a Vulnerability

If you discover a vulnerability, please **do not open a public issue**.  
Instead, contact the maintainer directly via GitHub or email.

- **Maintainer:** T.I.Q.S.  
- **GitHub:** [@tiqsclass6](https://github.com/tiqsclass6)

When reporting a vulnerability, please include:

- Description of the issue
- Steps to reproduce (if applicable)
- Possible impact or exploitation scenarios

---

## 🚧 Security Practices

- Sensitive variables such as AWS credentials must **never** be hardcoded.  
- Always use Terraform variables, environment variables, or AWS profiles.
- Terraform backends should be encrypted (e.g., S3 + DynamoDB for state locking).
- Restrict IAM permissions to least privilege when testing or deploying.

---

## ✅ Recommended Tools

- **Terraform Cloud / S3 Remote State Encryption**
- **AWS GuardDuty, Macie, and Config**
- **Static Analysis:** Snyk, tfsec, or Checkov
- **Runtime Security:** AWS CloudTrail and CloudWatch monitoring
