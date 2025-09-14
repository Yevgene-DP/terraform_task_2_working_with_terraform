output "blob_id" {
  description = "The ID of the storage blob"
  value       = azurerm_storage_blob.main.id
}

output "blob_url" {
  description = "The URL of the storage blob"
  value       = azurerm_storage_blob.main.url
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.main.name
}