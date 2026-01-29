# Module 1: Terraform Fundamentals

## Lesson 1: Introduction to IaC & Terraform

### What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through manual processes.

- **Declarative**: You define *what* you want (e.g., "I want a VM"), not *how* to build it.
- **Version Control**: You can track changes, rollback, and collaborate using Git.
- **Consistency**: Eliminate manual errors and "configuration drift".

### What is Terraform?

Terraform is an open-source IaC tool by HashiCorp.

- **Providers**: Plugins that interact with APIs (Azure, AWS, Google).
- **HCL (HashiCorp Configuration Language)**: The human-readable language used to define resources.
- **State**: Terraform keeps track of what it created in a `terraform.tfstate` file.

---

## Lesson 2: Installation & Setup

### 1. Install Terraform on Windows

We recommend using Chocolatey or manually downloading the binary.
**Option A: Chocolatey**

```powershell
choco install terraform
```

**Option B: Manual**

1. Download from [terraform.io](https://www.terraform.io/downloads).
2. Extract the `terraform.exe` to a folder (e.g., `C:\Apps\Terraform`).
3. Add that folder to your System PATH environment variable.

### 2. Install Azure CLI

Terraform needs to authenticate with Azure.

```powershell
invoke-webrequest -uri 'https://aka.ms/installazurecliwindows' -OutFile '.\AzureCLI.msi'
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
```

*Restart your terminal after installation.*

### 3. Authenticate

Run this command to log in:

```powershell
az login
```

This will open a browser window. Once logged in, Terraform can use your credentials.

---

## Lesson 3: First Resource (Azure Resource Group)

**Goal**: Create a Resource Group in Azure.

### Steps

1. Navigate to `labs/02_first_deployment`.
2. Create a file named `main.tf`.
3. Add the following code:

   ```hcl
   # Configure the Azure provider
   terraform {
     required_providers {
       azurerm = {
         source  = "hashicorp/azurerm"
         version = "~> 3.0"
       }
     }
   }

   provider "azurerm" {
     features {}
   }

   # Create a resource group
   resource "azurerm_resource_group" "example" {
     name     = "rg-terraform-course-01"
     location = "East US"
   }
   ```

4. Initialize Terraform (downloads the provider):

   ```bash
   terraform init
   ```

5. Plan the deployment (preview):

   ```bash
   terraform plan
   ```

6. Apply the changes:

   ```bash
   terraform apply
   ```

   Type `yes` when prompted.

---

## Lesson 4: Variables & Outputs

Hardcoding names (like "rg-terraform-course-01") is bad practice. Let's use variables.

### Concepts

- **Variables (`variables.tf`)**: Input parameters.
- **Outputs (`outputs.tf`)**: Data returned after deployment (e.g., IP addresses).
- **Values (`terraform.tfvars`)**: Where you define the values for variables.

### Lab

Navigate to `labs/03_variables` and create the files as described in the course content folders.
