module "scanner_stacks" {
  source = "../modules/scanner-stacks"
  projectID = var.projectID
  customRolePrefix = var.customRolePrefix
  packageURL = var.packageURL
  functionAutoUpdate = var.functionAutoUpdate
  scannerStacks = var.scannerStacks
}

module "function-auto-update-settings" {
  source = "../modules/function-auto-update-settings"
  functionAutoUpdate = var.functionAutoUpdate
  projectID = var.projectID
  customRolePrefix = var.customRolePrefix
  managementServiceAccounts = toset(module.scanner_stacks.management_service_accounts)
}
