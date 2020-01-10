  # https://www.terraform.io/docs/providers/azurerm/r/monitor_diagnostic_setting.html

  resource "azurerm_monitor_diagnostic_setting" "diagnostics" {

   name                             = "${var.name}-diag"
   target_resource_id               = var.resource_id
   
   eventhub_name                    = lookup(var.diagnostics_map, "eh_name", null)
   eventhub_authorization_rule_id   = lookup(var.diagnostics_map, "eh_id", null) != null ? "${var.diagnostics_map.eh_id}/authorizationrules/RootManageSharedAccessKey" : null
   
   log_analytics_workspace_id       = var.log_analytics_workspace_id
   log_analytics_destination_type   = lookup(var.diag_object, "log_analytics_destination_type", null)

   storage_account_id               = var.diagnostics_map.diags_sa
   
    dynamic "log" {
        for_each = var.diag_object.log
        content {
            category    = log.value[0]
            enabled =     log.value[1]
            retention_policy {
                enabled =     log.value[2]
                days    = log.value[3]
            }
        }
    }   

    dynamic "metric" {
        for_each = var.diag_object.metric
        content {
            category    = metric.value[0]
            enabled =     metric.value[1]
            retention_policy {
                enabled =     metric.value[2]
                days    = metric.value[3]
            }
            }
    }
  }  

