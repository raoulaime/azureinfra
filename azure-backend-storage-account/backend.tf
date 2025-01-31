resource "azurerm_resource_group" "tfbackend_rg" {
  name     = var.az_resource_group_name
  location = var.az_location
}

resource "azurerm_storage_account" "tfbackend_sa" {
  name                            = var.az_storage_account_name
  resource_group_name             = azurerm_resource_group.tfbackend_rg.name
  location                        = azurerm_resource_group.tfbackend_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
  tags = {
    owner = "rakit"
  }
}

resource "azurerm_storage_container" "tfbackend_blob" {
  name                  = var.az_storage_account_container_name
  storage_account_id    = azurerm_storage_account.tfbackend_sa.id
  container_access_type = "private"

}
