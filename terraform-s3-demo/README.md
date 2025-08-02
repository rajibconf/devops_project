
## 🚀 Current Project

### `terraform-s3-demo`

This folder contains a simple example of managing an AWS S3 bucket using [Terraform](https://www.terraform.io/), with backend state managed by [Terraform Cloud (HCP)](https://app.terraform.io).

#### Features:
- Remote backend configuration via Terraform Cloud
- Version-controlled infrastructure-as-code
- Basic AWS S3 bucket provisioning

#### Usage:
1. Clone the repository:
   ```bash
   git clone https://github.com/rajibconf/devops_project.git
   cd devops_project/terraform-s3-demo
   ```
2. Set up your Terraform Cloud workspace (e.g., s3-demo) and link it to this repository.

3. Run Terraform commands:
```bash
terraform init
terraform plan
terraform apply
```
⚠️ Make sure your AWS credentials are configured either in your Terraform Cloud workspace variables or locally via the AWS CLI.

