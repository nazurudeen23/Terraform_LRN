variable "azure_location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "East US"
}

variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix used for resource naming."
  type        = string
  default     = "multicloud-lab"
}
