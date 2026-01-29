# Capstone Project: 2-Tier Azure Architecture

## Objective

Deploy a complete infrastructure consisting of:

1. **Networking**: VNET, 2 Subnets (Web, Data), Network Security Group allowing HTTP (80).
2. **Compute**: A Linux Virtual Machine (Web Server) with Nginx installed via cloud-init.
3. **Database**: An Azure SQL Database (Basic Tier).
4. **Output**: The Public IP of the Web Server.

## Architecture

[ Web Subnet ] -> [ VM ] -> (Public IP)
      |
[ Data Subnet ] -> [ SQL DB ]

## Instructions

1. Initialize Terraform.
2. Run `terraform plan` and check the resources.
3. Run `terraform apply`.
4. Visit the IP address to see Nginx (it may take a few minutes to install).
