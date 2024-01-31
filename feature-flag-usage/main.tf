#
# In this example you see how to use feature flags to activate "encryption"
#
#
module "azure_storage" {
  source               = "../" # Points to the root module
  project_name         = "amazing-project"
  storage_account_name = "iacbestpracticesstorage"
  blob_storage_name    = "iacbestpracticesblobstorage"
}
