resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "${var.project}-${var.environment}-log-analytics"
  location            = local.location
  resource_group_name = azurerm_resource_group.lab_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_virtual_machine_extension" "azure_monitor_linux_agent" {
  name                       = "${var.project}-${var.environment}-azure-monitor-linux-agent"
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.21"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  virtual_machine_id = azurerm_linux_virtual_machine.linuxvm.id

  depends_on = [azurerm_linux_virtual_machine.linuxvm]
}


resource "azurerm_monitor_data_collection_rule" "data_collection_rule" {
  name                = "${var.project}-${var.environment}-data-rules"
  resource_group_name = azurerm_resource_group.lab_rg.name
  location            = local.location

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
      name                  = "${var.project}-destination-log"
    }

    azure_monitor_metrics {
      name = "${var.project}-destination-metrics"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics"]
    destinations = ["${var.project}-destination-log"]
  }

  data_sources {

    performance_counter {
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
      name                          = "VMInsightsPerfCounters"
    }
  }
}

resource "azurerm_monitor_data_collection_rule_association" "data_rule_association" {
  name                    = "${var.project}-${var.environment}-dcra"
  target_resource_id      = azurerm_linux_virtual_machine.linuxvm.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.data_collection_rule.id
  description             = "data-collection-rule-association"
}