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

# Create archive file from directory
data "archive_file" "content" {
  type        = "zip"
  source_dir  = var.archive_source_dir
  output_path = "${var.archive_source_dir}.zip"
}

# Create blob with archived content
resource "azurerm_storage_blob" "main" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.main.name
  type                   = "Block"
  source                 = data.archive_file.content.output_path  # Використання архіву

  metadata = {
    archived    = "true"
    source_dir  = var.archive_source_dir
    created_by  = "terraform"
  }
}

# Create additional blob with text content
resource "azurerm_storage_blob" "example" {
  name                   = "example.txt"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.main.name
  type                   = "Block"
  source_content         = var.blob_content
}