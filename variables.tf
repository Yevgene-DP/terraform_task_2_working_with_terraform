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
  description = "The name of the storage account (must be globally unique)"
  type        = string
  default     = "stterraformtask2unq"

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 lowercase letters and numbers."
  }
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "terraformcontainer"  # Без дефісів

  validation {
    condition     = can(regex("^[a-z0-9]{3,63}$", var.container_name))
    error_message = "Container name must be 3-63 lowercase letters and numbers."
  }
}

variable "blob_name" {
  description = "The name of the blob"
  type        = string
  default     = "content.zip"
}

variable "archive_source_dir" {
  description = "Directory to archive"
  type        = string
  default     = "./content"
}

variable "blob_content" {
  description = "The content of the blob"
  type        = string
  default     = "Hello, Terraform Task 2!"
}