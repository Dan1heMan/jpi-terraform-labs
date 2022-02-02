
# Call child modules and pass in values required

module "test_vm" {                      # Naming should be unique to the purpose of using this module
  source = "../modules/compute"         # Location of the module via its file path

# All arguments requiring values to be set
  instance_name = "test-database-vm"
  machine_type  = "f1-micro"
  zone          = var.zone
  tags          = ["test", "database"]
  project_id    = "jpi-dev-project-2"
  image_type    = "debian-cloud/debian-10" 
  vpc_name      = "dev-vpc-network"
  subnet        = "subnet-2"        
}
