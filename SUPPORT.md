# 🧰 Support Guide

Thank you for using **aws-repo-assignments**.  
This document explains how to get help, report issues, and request enhancements related to the Terraform-based AWS assignments in this repository.

---

## 💡 Before You Ask

Before opening an issue, please verify that you have completed the following:

- Run `terraform fmt -recursive` and `terraform validate`
- Review the project **README.md** for setup, deployment, and troubleshooting guidance
- Confirm AWS credentials are configured correctly (`aws sts get-caller-identity`)
- Ensure you are working on the **correct assignment branch**
  - Current supported branch: `assignment-12092025`

---

## 🧾 Getting Help

### 🐛 Report a Bug

To report a bug, open a new issue using:  
<https://github.com/tiqsclass6/aws-repo-assignments/issues>

Please include the following details:

- Branch name (e.g., `assignment-12232025`)
- Terraform version (`terraform version`)
- AWS region(s) involved
- Relevant error messages or logs
- Steps to reproduce the issue (if applicable)

Clear and complete reports help resolve issues faster.

---

### 💬 Request a Feature or Enhancement

To request a new feature or improvement, open an issue with the title format:

```text
[Feature Request] <short description>
```

Include:

- A brief description of the proposed enhancement
- The problem it solves or value it adds
- Whether it is assignment-related or portfolio-focused

---

### 🔧 Troubleshooting Help

Before submitting an issue, review the **Troubleshooting** section in the README for common problems related to:

- Terraform initialization and state
- CloudFront deployment delays
- S3 access permissions
- WAF configuration
- Cache invalidation behavior

---

## 🕐 Response Times

| Request Type           | Estimated Response Time |
|------------------------|-------------------------|
| Security-related issue | Within 24 hours         |
| General bug report     | 2–3 business days       |
| Feature request        | Up to 1 week            |

Response times may vary depending on assignment schedules and availability.

---

## 👨‍💻 Maintainer

**T.I.Q.S.**  
🌐 GitHub: <https://github.com/tiqsclass6>  
> *“Automate everything. Secure everything.”*
