variable "azure_location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "East US"
}


variable "project_name" {
  description = "Project name prefix used for resource naming."
  type        = string
  default     = "multicloud-lab"
}
