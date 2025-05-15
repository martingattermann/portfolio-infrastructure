# Terraform Hetzner Project

This repository contains Terraform configurations for managing infrastructure on Hetzner Cloud, as well as Ansible playbooks for provisioning and configuration management.

## Project Structure

```
hetzner/
├── terraform/
│   ├── environments/
│   │   └── dev/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       ├── terraform.tfvars
│   │       └── backend.tf
│   ├── modules/
│   │   ├── hetzner/
│   │   │   ├── compute/
│   │   │   └── network/
│   │   ├── tls/
│   │   └── cloudflare/
│   └── global/
│       └── provider.tf
├── ansible/
│   ├── ansible-playbook.yaml
│   ├── inventory/
│   ├── roles/
│   └── ansible.cfg
└── README.md
```

## Prerequisites

- Terraform >= 1.0.0
- Hetzner Cloud API token
- Ansible >= 2.10 (for provisioning and configuration)

## Environment Variables

Set the following environment variable in the main folder of the project:

```
export HCLOUD_TOKEN=your_hetzner_token #Replace with your Hetzner token
export CLOUDFLARE_API_TOKEN=your_cloudflare_token #Replace with your Cloudflare token
export TF_VAR_my_ip="$(curl -4 -s ifconfig.me)/32"
```

## Usage

1. Navigate to the environment directory:
   ```
   cd terraform/environments/dev
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review the plan:
   ```
   terraform plan
   ```

4. Apply the configuration:
   ```
   terraform apply
   ```

5. To destroy the infrastructure:
   ```
   terraform destroy
   ```

## Modules

- **hetzner/compute**: Creates Hetzner Cloud servers.
- **hetzner/network**: Creates Hetzner Cloud networks, subnets, and firewalls.
- **tls**: Generates SSH key pairs for server access.
- **cloudflare**: Manages DNS records for your domain via Cloudflare.

## Ansible

The `ansible/` directory contains playbooks and roles for configuring servers after provisioning. Inventory is dynamically generated from Hetzner Cloud resources.

## Customization

Create and edit the `terraform.tfvars` file in the environment directory to customize the deployment.

## Best Practices

- Keep sensitive information in environment variables or use a secure vault
- Use remote state storage for team collaboration
- Tag all resources appropriately
- Use consistent naming conventions
- Document module usage and variables