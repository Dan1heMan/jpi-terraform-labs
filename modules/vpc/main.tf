
# Modules should be dynamic/reusable and not contain any hard values, as these modules can be used multiple times for different applications

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# List all resources to be provisioned in this module

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet
  project       = var.project_id
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id      # This references the ID of the value of the network in this configuration (above)
}
