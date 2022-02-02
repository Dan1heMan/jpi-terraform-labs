
# Modules should be dynamic/reusable and not contain any hard values, as these modules can be used multiple times for different applications

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project

# List all resources to be provisioned in this module

resource "google_project" "project" {
  name       = var.project_id
  project_id = var.project_id
  folder_id  = var.folder_id
  billing_account = var.billing_account
}
