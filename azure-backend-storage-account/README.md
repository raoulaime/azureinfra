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
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.11.0, <5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.11.0, <5.0 |

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
| <a name="input_az_location"></a> [az\_location](#input\_az\_location) | n/a | `string` | `"canadacentral"` | no |
| <a name="input_az_region"></a> [az\_region](#input\_az\_region) | n/a | `string` | `"canadacentral"` | no |
| <a name="input_az_resource_group"></a> [az\_resource\_group](#input\_az\_resource\_group) | Azure Resource Group Name | `string` | `"lab-backend-rg"` | no |
| <a name="input_az_storage_account"></a> [az\_storage\_account](#input\_az\_storage\_account) | n/a | `string` | `"tfbackendrakit"` | no |
| <a name="input_az_storage_account_container"></a> [az\_storage\_account\_container](#input\_az\_storage\_account\_container) | n/a | `string` | `"tfstate"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | `"subscription_id"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->