
# Create the variables used in this module (the values for these are provided in infra-live for the relevant directory)
# Some variables require a default, even though this can be overwritten in infra-live

variable "project_id" {
  type        = string
  default     = "project_id"
  description = "project id"
}

variable "region" {
  type        = string
  default       = "c"
  description = "region"
}

variable "subnet" {
  type        = string
  default       = "subnet"
  description = "subnet name"
}

variable "cidr_range" {
  type        = string
  default       = "cidr"
  description = "cidr IP range"
}

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "name of the vpc" 
}

variable "firewall_name" {
  type        = string
  default     = "fw"
  description = "name of the fw rule" 
}

variable "ports" {
  type    = list(string)
  default = [ "port" ]
}

variable "target_tags" {
  type    = list(string)
  default = [ "tag" ]
}

variable "source_tags" {
  type    = list(string)
  default = [ "tag" ]
}
