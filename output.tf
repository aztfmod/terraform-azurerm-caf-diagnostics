output "object" {
  description = "Output the full object"
  value = azurerm_monitor_diagnostic_setting.diagnostics
}

output "name" {
  description = "Output the object name"
  value = azurerm_monitor_diagnostic_setting.diagnostics.name
}

output "id" {
  description = "Output the object ID"
  value = azurerm_monitor_diagnostic_setting.diagnostics.id
}
