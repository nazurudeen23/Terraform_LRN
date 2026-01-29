variable "location" {
  default = "East US"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "Password for VM and SQL"
  sensitive   = true
  default     = "P@ssw0rd1234!" # Change this in production!
}
