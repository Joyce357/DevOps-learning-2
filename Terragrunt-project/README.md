# Terragrunt AWS project

This project deploys the same VPC, security group, and EC2 resources as the sibling `Terraform-project`, but uses Terragrunt to keep environment configuration DRY and to manage dependencies and state consistently.

## Layout

```text
Terragrunt-project/
├── root.hcl                         # Shared backend, provider, and tags
├── modules/                         # Reusable Terraform modules
└── environments/
    ├── dev/
    │   ├── environment.hcl          # Dev-only values
    │   ├── vpc/terragrunt.hcl
    │   ├── security-group/terragrunt.hcl
    │   └── ec2/terragrunt.hcl
    └── production/
        ├── environment.hcl          # Production-only values
        ├── vpc/terragrunt.hcl
        ├── security-group/terragrunt.hcl
        └── ec2/terragrunt.hcl
```

Each component has separate Terraform state. Terragrunt reads outputs from dependencies and runs units in this order:

```text
vpc -> security-group -> ec2
  \--------------------^
```

## Prerequisites

- Terraform >= 1.5
- Terragrunt >= 1.0
- AWS credentials configured locally
- An existing S3 state bucket

The default bucket is `backupreplicatedbucket01`. Override it without editing code:

```shell
export TG_STATE_BUCKET="your-terraform-state-bucket"
```

Replace the example `admin_cidr` in `environments/dev/environment.hcl` before applying.

## Commands

Run one component:

```shell
cd environments/dev/vpc
terragrunt plan
terragrunt apply
```

Plan or deploy a complete environment in dependency order:

```shell
cd environments/dev
terragrunt run --all plan
terragrunt run --all apply
```

Destroy runs in reverse dependency order:

```shell
terragrunt run --all destroy
```

Format and validate Terragrunt configuration from the project root:

```shell
terragrunt hcl fmt
terragrunt hcl validate
```

## Why this is useful

| Concern | Existing Terraform project | This Terragrunt project |
|---|---|---|
| Provider configuration | Repeated in environment `main.tf` files | Generated once from `root.hcl` |
| Backend configuration | Repeated and manually keyed | One rule generates a unique key from the directory path |
| Environment values | Spread across variables, tfvars, and main files | Centralized in each `environment.hcl` |
| Dependencies | Resources are coupled in one root module | Units have explicit dependency/output wiring |
| State isolation | One state per whole environment | One state per environment component, reducing blast radius |
| Whole-environment commands | Run Terraform once against a monolithic root | `terragrunt run --all` calculates dependency order |
| Adding an environment | Copy and edit several Terraform files | Copy an environment folder and change its values |

Terragrunt adds another tool and a cache directory, so plain Terraform can remain simpler for small deployments. Its value becomes clearer as the number of environments, regions, accounts, and independently deployed components grows.

No resources are applied automatically by this example. EC2 instances and production NAT gateways incur AWS charges.
