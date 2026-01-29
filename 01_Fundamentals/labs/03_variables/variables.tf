variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-terraform-lab-variables"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "Prefix for resources"
  type        = string
  default     = "demo"
}
