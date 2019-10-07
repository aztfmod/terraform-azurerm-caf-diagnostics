[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/diagnostics)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=0)
# Deploys diagnostics settings for an Azure resource
Deploys the diagnostics settings for an already existing Azure resource


Reference the module to a specific version (recommended):
```hcl
module "diagnostics" {
    source                  = "git://github.com/aztfmod/diagnostics.git?ref=v0.1"
  
    name                              = var.name
    resource_id                       = var.resource_id
    diag_object                       = var.diag_object
    diagnostics_map                   = var.diagsmap
    log_analytics_workspace_id        = var.laworkspaceid
}
```

Or get the latest version
```hcl
module "diagnostics" {
    source                  = "git://github.com/aztfmod/diagnostics.git?ref=latest"
  
    name                              = var.name
    resource_id                       = var.resource_id
    diag_object                       = var.diag_object
    diagnostics_map                   = var.diagsmap
    log_analytics_workspace_id        = var.laworkspaceid
}
```

# Parameters
## name
(Required) name of the diagnostics object (will be appended with -diag)
```hcl
variable "name" {
  description = "(Required) Name of the diagnostics object."
}

```
Example
```hcl
name = "vnet"
```

## resource_id
(Required) (Required) ully qualified Azure resource identifier for which you enable diagnostics.

```hcl
variable "resource_id" {
  description = "(Required) Fully qualified Azure resource identifier for which you enable diagnostics." 
}

```
Example
```hcl
resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/uqvh-hub-operations/providers/Microsoft.RecoveryServices/vaults/asr-edo"
```

## log_analytics_workspace_id
(Required) contains the log analytics workspace details for operations diagnostics."

```hcl
variable "log_analytics_workspace_id" {
  description = "(Required) contains the log analytics workspace details for operations diagnostics"
}
```
Example
```hcl
  log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/operations-rg/providers/microsoft.operationalinsights/workspaces/lalogs"
```

## diagnostics_map
(Required) Map with the diagnostics repository information"
```hcl
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example
```hcl
  diagnostics_map = {
      diags_sa      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.Storage/storageAccounts/opslogskumowxv"
      eh_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.EventHub/namespaces/opslogskumowxv"
      eh_name       = "opslogskumowxv"
  }
```

## diag_object
(Required) Map with the diagnostics information to be applied to the resource"
diag_object is a complex object describing the configuration of diagnostics logging for a component, as follows: 

```hcl
variable "diag_object" {
  description = "(Required) Contains the diagnostics setting object." 
}
```

Example
```hcl
 diag_object = {
     log = [
                 # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period],
                 ["AzureBackupReport", true, true, 100],
                 ["AzureSiteRecoveryJobs", true, true, 20],
                 ["AzureSiteRecoveryEvents", true, true, 30],
                 ["AzureSiteRecoveryReplicatedItems", true, true, 40],
                 ["AzureSiteRecoveryReplicationStats", true, true, 50],
                 ["AzureSiteRecoveryRecoveryPoints", true, true, 60],
                 ["AzureSiteRecoveryReplicationDataUploadRate", true, true, 70],
                 ["AzureSiteRecoveryProtectedDiskDataChurn", true, true, 80],
         ]
     metric = [
                 #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period],
                 ["AllMetrics", 60, True],
     ]
 }
```

# Outputs
## object
Outputs the created diagnostics object: 
```hcl
output "object" {
  value = azurerm_monitor_diagnostic_setting.diagnostics
}

```

## name
Outputs the name created diagnostics object: 
```hcl
output "name" {
  value = azurerm_monitor_diagnostic_setting.diagnostics.name
}

```

## id
Outputs the created diagnostics object: 
```hcl
output "id" {
  value = azurerm_monitor_diagnostic_setting.diagnostics.id
}

```