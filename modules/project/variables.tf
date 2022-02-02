
# Create the variables used in this module (the values for these are provided in infra-live for the relevant directory)
# Some variables require a default, even though this can be overwritten in infra-live

variable "project_id" {
  type        = string
  default = "project"
  description = "project id"
}

variable "region" {
  type        = string
  default       = "c"
  description = "region"
}

variable "folder_id" {
  type        = string
  description = "folder for project"
}

variable "billing_account" {
  type        = string
  description = "billing account for project"
}
