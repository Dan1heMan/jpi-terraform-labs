
# Call child modules and pass in values required

module "firewall" {                      # Naming should be unique to the purpose of using this module
  source = "../modules/firewall"         # Location of the module via its file path

# All arguments requiring values to be set
  firewall_name = "ssh"
  project_id    = "jpi-dev-project-2"
  vpc_name      = "dev-vpc-network"
  ports         = ["22"]
  source_tags   = ["win"]
  target_tags   = ["database"]
}
