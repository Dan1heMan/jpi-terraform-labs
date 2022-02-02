
# Call child modules and pass in values required

module "primary_vpc" {              # Naming should be unique to the purpose of using this module
  source = "../modules/vpc"         # Location of the module via its file path

# All arguments requiring values to be set
  project_id   = "jpi-dev-project-2" 
  vpc_name     = "dev-vpc-network"

  subnet        = "subnet-2"
  cidr_range    = "10.0.0.0/24"         
  region        = "europe-west2"
}
