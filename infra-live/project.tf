
# Call child modules and pass in values required

module "dev_project" {                        # Naming should be unique to the purpose of using this module
  source = "../modules/project"               # Location of the module via its file path

# All arguments requiring values to be set
  project_id      = "jpi-dev-project-2"       # Project ID entered explicitly
  folder_id       = var.folder_id
  billing_account = var.billing_account   
}

module "staging_project" {    
  source = "../modules/project"

  project_id      = "jpi-staging-project-2"   # Different value provided here as we want a second project for staging
  folder_id       = var.folder_id             # Still using the same folder ID defined in variables.tf
  billing_account = var.billing_account              
}
