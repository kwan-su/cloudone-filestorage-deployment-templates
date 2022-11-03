module "storage_stacks" {
  source = "../modules/storage-stacks"
  projectID = var.projectID
  customRolePrefix = var.customRolePrefix
  storageStacks = var.storageStacks
  functionAutoUpdate = var.functionAutoUpdate
  scanner_service_accounts = null
  scanner_pubsub_topics = null
}

module "function-auto-update-settings" {
  source = "../modules/function-auto-update-settings"
  functionAutoUpdate = var.functionAutoUpdate
  projectID = var.projectID
  customRolePrefix = var.customRolePrefix
  managementServiceAccounts = toset(module.storage_stacks.management_service_accounts)
}
