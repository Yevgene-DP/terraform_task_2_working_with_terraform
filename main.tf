# Create resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Create storage account
resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "test"
    project     = "terraform-task2"
  }
}

# Create storage container
resource "azurerm_storage_container" "main" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

# Create local directory for content
resource "local_file" "example_content" {
  filename = "${var.archive_source_dir}/example.txt"
  content  = "This is example content for Terraform task 2"
}

# Create archive of the directory
data "archive_file" "content_archive" {
  type        = "zip"
  source_dir  = var.archive_source_dir
  output_path = "./content.zip"

  depends_on = [local_file.example_content]
}

# Create blob from archive
resource "azurerm_storage_blob" "main" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.main.name
  type                   = "Block"
  source                 = data.archive_file.content_archive.output_path

  depends_on = [data.archive_file.content_archive]
}