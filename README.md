# España Static Website – AWS S3 Deployment

## Cloud Static Web Hosting • Terraform IaC • S3 Website Hosting  

![Terraform](https://img.shields.io/badge/Terraform-v1.14-623CE4?style=for-the-badge&logo=terraform)
![AWS S3](https://img.shields.io/badge/AWS-S3_Static_Hosting-orange?style=for-the-badge&logo=amazonaws)
![HTML5](https://img.shields.io/badge/Frontend-HTML5-blue?style=for-the-badge&logo=html5)
![CSS3](https://img.shields.io/badge/Styling-CSS3-264DE4?style=for-the-badge&logo=css3)
![YouTube](https://img.shields.io/badge/YouTube-Embedded_Audio-FF0000?style=for-the-badge&logo=youtube)
![Cloud](https://img.shields.io/badge/Cloud-AWS_Cloud-orange?style=for-the-badge&logo=amazonaws)
![GitHub](https://img.shields.io/badge/GitHub-tiqsclass6-181717?style=for-the-badge&logo=github)

## 📌 Project Overview

This project deploys a fully animated **España-themed static website** to **AWS S3** using **Terraform**, featuring background music, an interactive carousel, shimmering text, and glowing flag-color effects. The deployment follows modern AWS best practices including **Bucket Owner Enforced** (no ACLs) and fully automated provisioning using Infrastructure as Code.

![diagram.png](/Screenshots/diagram.png)

---

### 🌍 Why S3 Static Websites Matter

S3 is one of the most effective platforms for hosting static websites because it provides:

- **Ultra-low cost hosting** — often pennies per month  
- **High availability & durability** across multiple Availability Zones  
- **Automatic scaling** for millions of requests with zero server management  
- **Perfect support for static frontends** (HTML, CSS, JavaScript, React, Vue, etc.)  
- **Simple integration** with Route 53, ACM, and CloudFront for global performance  
- **Terraform automation**, enabling repeatable, version-controlled deployments  
- **Strong security posture** using Bucket Ownership Controls instead of ACLs  

### 🌟 Key Features

- 🇦🇷 España-styled, fully animated UI  
- 🎵 Background music with click-to-unmute  
- 🔁 Responsive auto-playing carousel with pause-on-hover  
- ✨ Shimmering gradient text & glowing flag-color borders  
- 🌐 S3 static website hosting  
- 🧩 Terraform-based deployment workflow  

---

## 🗂 Project Structure

```plaintext
assignment-12022025/
│
├── .gitignore
├── 1-provider.tf             # Terraform AWS provider setup  
├── 2-s3.tf                   # S3 bucket and website configuration
├── 3-outputs.tf              # Outputs for website URL
├── A-index.html              # Main website page
├── B-wifey.html              # Secondary website page
└── README.md                 # Project documentation
```

---

## 🚀 Deployment Steps

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve
```

![terraform-init-fmt-validate.jpg](/Screenshots/terraform-init-fmt-validate.jpg)
![terraform-plan.jpg](/Screenshots/terraform-plan.jpg)
![terraform-apply.jpg](/Screenshots/terraform-apply.jpg)

```plaintext
bucket_information = {
  "arn" = "arn:aws:s3:::tiqs-spain-static-bucket"
  "name" = "tiqs-spain-static-bucket"
}

website_url = "http://tiqs-spain-static-bucket.s3-website-eu-south-2.amazonaws.com"
```

---

## ⚙️ Terraform Architecture

| Resource | Description |
|---------|-------------|
| `aws_s3_bucket.static_site` | **Main website bucket** |
| `aws_s3_bucket_website_configuration` | **Static hosting** |
| `aws_s3_bucket_public_access_block.public_access` | **Blocks ACLs** |
| `aws_s3_bucket_ownership_controls.ownership` | **BucketOwnerEnforced** |
| `aws_s3_bucket_policy.public_policy` | **Public read** |
| `aws_s3_object.index_html` | **Uploads index** |
| `aws_s3_object.error_html` | **Uploads error page** |

---

## 📸 Screenshots (Show Your Work!)

- **S3 Static Website**  
  ![España Website Homepage](/Screenshots/s3-static-site.jpg)

- **S3 Error Page**  
  ![Website Error Page](/Screenshots/s3-error-html.jpg)

- **AWS S3 Bucket**  
  ![S3 Bucket](/Screenshots/aws-s3-bucket.jpg)

- **AWS Static Objects**  
  ![S3 Objects](/Screenshots/aws-s3-objects.jpg)

- **AWS S3 Object Details**  
  ![S3 Index Details](/Screenshots/aws-s3-object-index-html.jpg)
  ![S3 Error Details](/Screenshots/aws-s3-object-error-html.jpg)

- **AWS Bucket Policy**  
  ![S3 Bucket Policy](/Screenshots/aws-s3-bucket-policy.jpg)

- **AWS S3 Bucket Properties**  
  ![S3 Bucket Properties](/Screenshots/aws-s3-bucket-properties.jpg)

- **AWS S3 Bucket Settings**  
  ![S3 Bucket Settings](/Screenshots/aws-s3-bucket-settings.jpg)

- **AWS Static Hosting Configuration**  
  ![S3 Static Hosting Config](/Screenshots/aws-s3-static-hosting.jpg)

---

## 🧹 Teardown Steps

```bash
terraform destroy -auto-approve
```

![terraform-destroy.jpg](/Screenshots/terraform-destroy.jpg)

---

## 🛠 Troubleshooting

### **index.html not appearing**

Remove ACLs when using BucketOwnerEnforced. (if necessary)

### **AccessControlListNotSupported**

Use bucket policies only.

### **Remove bad state entries**

```bash
terraform state rm aws_s3_object.index_html
terraform state rm aws_s3_object.wifey_html
```

### **Music not playing**

Use a 1 × 1 invisible iframe instead of hidden/zero-sized.

---

## 🔗 References

### 🏗️ Infrastructure & Terraform

- **Terraform – S3 Bucket Website Configuration**  
  <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration>  

- **Terraform – AWS S3 Bucket Policy**  
  <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy>  

- **Terraform – AWS S3 Object**  
  <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object>  

- **AWS S3 Static Website Hosting Guide**  
  <https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html>  

- **AWS S3 Block Public Access (Explains ACL Blocking)**  
  <https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html>  

- **AWS S3 Object Ownership (BucketOwnerEnforced Explanation)**  
  <https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html>  

### 🌐 Frontend, Browser Policies, HTML5

- **Chrome Autoplay Audio/Video Policies**  
  <https://developer.chrome.com/blog/autoplay>  

- **YouTube Embed Player Parameters**  
  <https://developers.google.com/youtube/player_parameters>  

- **MDN – `<iframe>` Tag Reference**  
  <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe>  

- **MDN – CSS Animations Guide**  
  <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations>  

- **MDN – CSS Keyframes Reference**  
  <https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes>  

### 📦 S3 Troubleshooting & Website Tips

- **AWS – Understanding S3 Object URL Formats**  
  <https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-bucket-intro.html>  

---

## ✍️ Authors

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney

---
