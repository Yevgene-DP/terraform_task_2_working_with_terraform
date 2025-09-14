variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-terraform-task2"
}

variable "location" {
  description = "The Azure region where resources will be created"
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

variable "archive_source_dir" {
  description = "The directory to archive"
  type        = string
  default     = "./content"
}