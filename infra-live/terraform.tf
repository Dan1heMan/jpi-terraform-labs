# Define base Terraform configuration such as provider information and backend location

terraform {
  backend "gcs" {
    bucket = "cts-terraform-labs-pfactory-tfstate"
    prefix = "state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.1"
    }
  }
}

data "google_client_config" "default" {}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}
