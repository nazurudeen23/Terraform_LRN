terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "suffix" {
  byte_length = 4
}

# 1. Azure Resource: Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.azure_location
}

# 2. AWS Resource: S3 Bucket
# We use the random suffix to ensure global uniqueness for the bucket name
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-bucket-${random_id.suffix.hex}"

  tags = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
    # Cross-Cloud Dependency: Referencing Azure Resource Group Name
    AzureSourceRG = azurerm_resource_group.rg.name
  }
}
