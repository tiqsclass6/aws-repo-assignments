# 🤝 Contributing to `aws-repo-assignments`

Thank you for your interest in contributing to **aws-repo-assignments**!  We welcome all contributions — whether it's fixing typos, improving documentation, or enhancing Terraform configurations.

---

## 🧭 Contribution Workflow

1. **Fork the repository**

   ```bash
   git clone https://github.com/tiqsclass6/aws-repo-assignments
   cd aws-repo-assignments
   git checkout -b feature/<your-feature-name>
   ```

2. **Make your changes**
   - Follow the repository's modular structure.
   - Ensure Terraform code passes `terraform validate` and `terraform fmt -recursive`.
   - Include descriptive commit messages.

3. **Test your code**

   ```bash
   terraform init
   terraform validate
   terraform plan
   ```

4. **Submit a Pull Request (PR)**
   - Push your branch:

     ```bash
     git push origin feature/<your-feature-name>
     ```

   - Create a PR describing:
     - The purpose of your change
     - Related issues (if any)
     - Testing or validation steps

---

## 🧹 Code Standards

- **Terraform Formatting**: Always run `terraform fmt -recursive` before committing.
- **Naming**: Use clear, consistent filenames like `3-igw.tf` or `A-backend.tf`.
- **Comments**: Add meaningful inline comments to describe purpose and logic.
- **No hardcoded credentials**: Use environment variables or Terraform variables.

---

## ✅ Commit Message Guidelines

Use the following structure:

```plaintext
<type>(scope): short description
```

**Example:**

```plaintext
feat(network): add NAT Gateway configuration
fix(auth):     correct provider region variable
docs(readme):  update branch breakdown table
```

---

## 💬 Feedback

For any questions, suggestions, or design discussions, open an issue or reach out directly via [GitHub Issues](https://github.com/tiqsclass6/aws-repo-assignments/issues).

---

### Maintained by

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
