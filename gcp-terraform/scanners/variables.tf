variable "scannerStacks" {
  type = map(object({
    region = string
    managementServiceAccountProjectID = string
    managementServiceAccountID = string
  }))

  description = "File Storage Security Scanner Stacks"

  validation {
    condition = (
      contains([for s in var.scannerStacks : (
          length(keys(var.scannerStacks)) < 100 &&
          lookup(s,"region", null) == null ? false : true &&
          lookup(s,"managementServiceAccountProjectID", null) == null ? false : true &&
          lookup(s,"managementServiceAccountID", null) == null ? false : true
      )], false) == true ? false : true
    )
    error_message = "Input validation failed."
  }
}

variable "projectID" {
  type = string
  description = "The GCP project ID you want to apply the deployment to."
  default = ""
}

variable "customRolePrefix" {
  type = string
  default = ""
}

variable "packageURL" {
  type = string
  description = "The GCP Cloud Function package location."
  default = "https://file-storage-security.s3.amazonaws.com/latest/cloud-functions/"
}

variable "functionAutoUpdate" {
  type = bool
  description = "Enable or disable automatic remote code update."
  default = true
}