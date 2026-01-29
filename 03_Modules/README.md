# Module 3: Modules & Structure

## Lesson 7: Introduction to Modules

### What is a Module?

A module is a container for multiple resources that are used together.

- **Root Module**: Every directory with `.tf` files is technically a module.
- **Child Module**: A module that is called by another module.

### Why use Modules?

1. **Reusability**: Write the VNET configuration once, use it in dev, stage, and prod.
2. **Encapsulation**: Hide complexity. The user just says "I want a VNET" and doesn't need to know about subnets, NSGs, and peering details.
3. **Consistency**: Ensure all VNETs follow the same tagging rules.

---

## Lesson 8: Creating Reusable Azure Modules

### Structure of a Module

A standard module structure looks like this:

```
modules/
  my_module/
    main.tf       # Resources
    variables.tf  # Inputs (Parameters)
    outputs.tf    # Return values
```

### Lab: Creating a VNET Module

**Goal**: Create a module that deploys a VNET and a default subnet.

1. **Create the Module**:
   - Navigate to `labs/01_local_module/modules/vnet`.
   - Create `main.tf`, `variables.tf`, `outputs.tf`.

2. **Consume the Module**:
   - Navigate to `labs/01_local_module`.
   - Create `main.tf` to call the module.

   ```hcl
   module "network" {
     source = "./modules/vnet"
     
     vnet_name = "vnet-module-demo"
     location  = "East US"
     ...
   }
   ```
