variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-terraform-task2"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "stterraformtask2"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "terraform-container"
}

variable "blob_name" {
  description = "The name of the blob"
  type        = string
  default     = "example.txt"
}

variable "blob_content" {
  description = "The content of the blob"
  type        = string
  default     = "Hello, Terraform Task 2!"
}