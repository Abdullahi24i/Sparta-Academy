
# Terraform Input Variables Documentation

Terraform input variables allow you to **parameterize** your Terraform configurations, making them **reusable**, **customizable**, and easier to manage.

---

## 📌 What Are Input Variables?

Input variables act like **function arguments** in programming. You define them in `.tf` files and assign values when calling or applying your Terraform configuration.

---

## 📂 How to Define Input Variables

Variables are defined using the `variable` block.

```hcl
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
```

---

## 🧠 Variable Types

Terraform supports several variable types:

- **string**
- **number**
- **bool**
- **list(type)** / `[]`
- **map(type)** / `{}`

```hcl
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Owner       = "abdullahi"
  }
}
```

---

## 💡 Using Variables in Resources

Reference a variable using `var.<name>`:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = var.instance_type
  tags          = var.tags
}
```

---

## 🎛 How to Set Variable Values

### 1. **Using `.tfvars` File**

```hcl
# terraform.tfvars
region         = "eu-west-1"
instance_type  = "t3.micro"
```

### 2. **Passing via CLI**

```bash
terraform apply -var="region=eu-west-1" -var="instance_type=t3.micro"
```

### 3. **Environment Variables**

Terraform reads any env variable in the format:

```
TF_VAR_<variable_name>
```

Example:

```bash
export TF_VAR_region="eu-west-1"
```

---

## 🔐 Sensitive Variables

Mark variables as `sensitive` to hide them in logs:

```hcl
variable "db_password" {
  type      = string
  sensitive = true
}
```

---

## 📁 Example: Full Variable Usage

**`variables.tf`**
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}
```

**`main.tf`**
```hcl
provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = var.instance_type
}
```

**`terraform.tfvars`**
```hcl
region        = "eu-west-1"
instance_type = "t3.micro"
```

---

## ✅ Best Practices

- Always provide a **description** for clarity.
- Use `.tfvars` or CLI for environment-specific values.
- Store **secrets** in a secure location, like a secret manager or environment variables.
- Use **default values** for common configurations.

---

## 📚 Resources

- [Terraform Input Variables Docs](https://developer.hashicorp.com/terraform/language/values/variables)
- [Terraform CLI Docs](https://developer.hashicorp.com/terraform/cli)

---
