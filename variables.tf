variable "resource_group_name" {
  description = "The name of the resource group this storage account belongs to. Creates one if not provided"
  type        = string
  default     = null # It's optional
}

variable "location" {
  type        = string
  description = "The location of the storage resources"
  default     = "uksouth"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "blob_storage_name" {
  description = "The name of the blob storage"
  type        = string
}

variable "project_name" {
  type = string
}