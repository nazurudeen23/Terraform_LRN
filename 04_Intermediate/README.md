# Module 4: Azure Integration & Intermediate Topics

## Lesson 9: Azure Key Vault Integration

### Managing Secrets

Never store passwords in plain text in your TF files.
Use Azure Key Vault to store secrets and let Terraform read/write them.

### Lab: Key Vault Management

In `labs/01_keyvault`, we will:

1. Create a Key Vault.
2. Store a secret (e.g., a database password).
3. Retrieve that secret in Terraform.

**Important**: The user running Terraform needs "Key Vault Administrator" or proper Access Policy permissions to manage secrets.

---

## Lesson 10: Workspaces

### What are Workspaces?

Workspaces allow you to have multiple states for the same configuration.

- `default` workspace.
- `dev`, `prod` workspaces.

### Usage

- `terraform workspace new dev`
- `terraform workspace select dev`
- Access the current workspace name via `${terraform.workspace}`.

### Lab: Workspace-aware Naming

In `labs/02_workspaces`, we use the workspace name in resource names.

```hcl
resource "azurerm_resource_group" "rg" {
  name = "rg-app-${terraform.workspace}"
  ...
}
```

---

## Lesson 11: Provisioners (The "Last Resort")

### What are they?

Scripts that run on the local machine (`local-exec`) or the remote machine (`remote-exec`) after creation.

### Why Avoid?

- Not declarative.
- If they fail, Terraform state gets messy (tainted resources).
- Better to use `cloud-init` (for VMs) or Kubernetes manifests.
