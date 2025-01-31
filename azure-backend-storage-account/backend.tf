resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.az_resource_group
  location = var.az_location
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                            = var.az_storage_account
  resource_group_name             = azurerm_resource_group.tfstate_rg.name
  location                        = azurerm_resource_group.tfstate_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    repo  = "ansible-terraform"
    owner = "rakit"
  }
}

resource "azurerm_storage_container" "tfsate_blob" {
  name                  = var.az_storage_account_container
  storage_account_id = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"

}
