# Module 2: State Management

## Lesson 5: Understanding State

### What is `terraform.tfstate`?

Terraform stores the state of your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

- **Mapping**: Terraform knows that resource `azurerm_resource_group.rg` maps to the Azure ID `/subscriptions/xxx/resourceGroups/rg-lab`.
- **Source of Truth**: By default, stored locally in `terraform.tfstate`.

### Dangers of Local State

1. **Collaboration**: If I change the file, you don't see it. We might overwrite each other.
2. **Secrets**: State file contains secrets in plain text.
3. **Loss**: If you delete the file, Terraform forgets the resources exist.

---

## Lesson 6: Remote Backend (Azure Storage)

### Solution: Storing State in the Cloud

We can store the state file in an Azure Storage Account Blob Container. This supports:

- **Locking**: Prevents two people from running `apply` at the same time.
- **Consistency**: Centralized source of truth.

### Lab: Migrating to Remote State

#### Step 1: Create the Storage Account

Run the provided script `setup_backend.ps1` in the `labs/01_remote_state` folder. It will:

1. Create a Resource Group (e.g., `rg-tfstate`).
2. Create a Storage Account.
3. Create a Blob Container named `tfstate`.

#### Step 2: Configure Terraform

In your `main.tf`, add the `backend` block:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "<unique_storage_name>"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
```

#### Step 3: Initialize

Run `terraform init`. Terraform will ask to copy your existing local state to the new Azure backend.
