
# Modules should be dynamic/reusable and not contain any hard values, as these modules can be used multiple times for different applications

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# List all resources to be provisioned in this module

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    subnetwork = var.subnet
    subnetwork_project = var.project_id
  }
}
