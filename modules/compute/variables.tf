
# Create the variables used in this module (the values for these are provided in infra-live for the relevant directory)
# Some variables require a default, even though this can be overwritten in infra-live

variable "project_id" {
  type        = string
  default     = "project"
  description = "project id"
}

variable "region" {
  type        = string
  default       = "c"
  description = "region"
}

variable "tags" {
  type    = list(string)
  default = [ "tag" ]
}

variable "instance_name" {
  type        = string
  default     = "instance_name"
  description = "VM name"
}

variable "machine_type" {
  type        = string
  default       = "machine_type"
  description = "VM machine type"
}

variable "zone" {
  type        = string
  default       = "zone"
  description = "zone"
}

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "name of the vpc" 
}

variable "image_type" {
  type        = string
  default     = "image_type"
  description = "image type" 
}

variable "subnet" {
  type        = string
  default       = "subnet"
  description = "subnet name"
}
