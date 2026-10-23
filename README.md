# Terraform AWS Security Group Module

A simple, reusable Terraform module to create an AWS Security Group inside an existing VPC. This project demonstrates Terraform module development, input variables, outputs, and AWS network security configuration.

## Features

- Creates an AWS Security Group in an existing VPC.
- Configures an HTTP ingress rule on port 80.
- Configures outbound traffic rules.
- Uses input variables to customize the module.
- Exports the Security Group ID as an output.
- Designed for reuse across Terraform projects.

## Architecture

```text
Root Module
    |
    |-- Passes VPC ID and configuration
    v
Security Group Module
    |
    |-- Creates AWS Security Group
    |-- Configures ingress and egress rules
    v
AWS Security Group
    |
    |-- Exposes Security Group ID
```

## Prerequisites

- Terraform installed
- An AWS account
- AWS credentials configured securely
- An existing VPC in AWS

## Usage

Add the following to your root module's `main.tf`:

```hcl
module "security_group" {
  source = "git::https://github.com/Avinash-0009/terraform-aws-security-group.git"

  name         = "app-security-group"
  vpc_id       = "vpc-xxxxxxxx"
  ingress_cidr = "0.0.0.0/0"
  egress_cidr  = "0.0.0.0/0"
}
```

Replace `vpc-xxxxxxxx` with your actual VPC ID.

Initialize Terraform to download the module:

```bash
terraform init
terraform validate
terraform plan
```

## Input Variables

| Variable | Description | Default | Required |
|---|---|---|---|
| `name` | Name of the Security Group | `app-security-group` | No |
| `vpc_id` | ID of the existing VPC | None | Yes |
| `ingress_cidr` | IPv4 source range allowed to access HTTP | `0.0.0.0/0` | No |
| `egress_cidr` | IPv4 destination range allowed for outbound traffic | `0.0.0.0/0` | No |

## Outputs

| Output | Description |
|---|---|
| `security_group_id` | ID of the created AWS Security Group |

Example:

```hcl
module.security_group.security_group_id
```

## Security Rules

| Direction | Protocol | Port | Default CIDR |
|---|---|---|---|
| Ingress | TCP | 80 (HTTP) | `0.0.0.0/0` |
| Egress | All protocols | All ports | `0.0.0.0/0` |

The default ingress rule permits HTTP connections from any IPv4 address. Restrict the CIDR range if public access is not required.

The default egress rule allows outbound IPv4 traffic to any destination. Production environments may require more restrictive outbound rules.

## Project Structure

```text
terraform-aws-security-group/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── .gitignore
```

## Validation

Format and validate the Terraform configuration using:

```bash
terraform fmt -recursive
terraform init
terraform validate
```

Run validation from a suitable root configuration with the required provider configuration. Validation alone does not confirm that the AWS resources can be deployed successfully.

## Learning Objectives

This project was created to practice:

- Writing reusable Terraform modules from scratch
- Defining input variables and outputs
- Referencing existing AWS resources
- Configuring AWS Security Group ingress and egress rules
- Connecting child modules through a root module
- Managing infrastructure code with Git and GitHub

## Future Improvements

- Support multiple configurable ingress and egress rules
- Add HTTPS support on port 443
- Add examples and automated validation
- Improve rule customization and security defaults

## Author

**Avinash Jogi**

GitHub: [Avinash-0009](https://github.com/Avinash-0009)

---

*Built as a hands-on Terraform and AWS learning project.*
## License

This project is licensed under the [MIT License](LICENSE).