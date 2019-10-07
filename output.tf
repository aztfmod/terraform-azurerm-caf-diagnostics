output "object" {
  value = azurerm_monitor_diagnostic_setting.diagnostics
}

output "name" {
  value = azurerm_monitor_diagnostic_setting.diagnostics.name
}

output "id" {
  value = azurerm_monitor_diagnostic_setting.diagnostics.id
}
