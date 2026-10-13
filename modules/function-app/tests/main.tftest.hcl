mock_provider "azurerm" {}
mock_provider "external" {}

run "function_app_uses_https" {
  command = plan

  variables {
    name                          = "calibration-func"
    resource_group_name           = "calibration-rg"
    location                      = "eastus"
    storage_account_name          = "calibrationstore"
    storage_account_id            = "/subscriptions/mock/resourceGroups/calibration-rg/providers/Microsoft.Storage/storageAccounts/calibrationstore"
    public_network_access_enabled = false
  }

  override_data {
    target = data.external.build_info
    values = { result = { revision = "test" } }
  }

  assert {
    condition     = azurerm_linux_function_app.this.https_only
    error_message = "Function app traffic must use HTTPS."
  }
}