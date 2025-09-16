output "blob_id" {
  description = "The ID of the storage blob"
  value       = azurerm_storage_blob.main.id
}

output "blob_url" {
  description = "The URL of the storage blob"
  value       = azurerm_storage_blob.main.url
}

output "archive_blob_id" {
  description = "The ID of the archived blob"
  value       = azurerm_storage_blob.archive.id
}

output "archive_blob_url" {
  description = "The URL of the archived blob"
  value       = azurerm_storage_blob.archive.url
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.main.name
}