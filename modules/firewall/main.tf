
# Modules should be dynamic/reusable and not contain any hard values, as these modules can be used multiple times for different applications

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

# List all resources to be provisioned in this module

resource "google_compute_firewall" "rule" {
  project     = var.project_id
  name        = var.firewall_name
  network     = var.vpc_name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = var.ports
  }

  source_tags = var.source_tags
  target_tags = var.target_tags
}
