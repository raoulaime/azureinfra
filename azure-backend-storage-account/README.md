# Create Remote Storage

This Terraform project contains the configurations required to deploy a storage account in Azure to serve as the backend for other Terraform project state files.

- [Providers](./providers.tf)
- [Variables](./variables.tf)
- [Main](./main.tf)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.9.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.tfbackend_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.tfbackend_sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfbackend_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_location"></a> [az\_location](#input\_az\_location) | Azure Region | `string` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | Azure Resource Group Name | `string` | n/a | yes |
| <a name="input_az_storage_account_container_name"></a> [az\_storage\_account\_container\_name](#input\_az\_storage\_account\_container\_name) | Azure Terraform Backend Storage Account Container | `string` | n/a | yes |
| <a name="input_az_storage_account_name"></a> [az\_storage\_account\_name](#input\_az\_storage\_account\_name) | Azure Storage Account Name | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | subscription\_id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->