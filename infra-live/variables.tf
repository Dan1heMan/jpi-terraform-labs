
# Define the values for the variables to save repeating yourself
# Using static values with the 'default' argument are only useful for times where the variables are the same across multiple modules or resources

variable "project_id" {
  type = string
  default = "project_id"
}

variable "region" {
  type        = string
  default     = "c"
  description = "region"
}

variable "folder_id" {
  type        = string
  default     = "102489096091"          # Providing a fixed value here as we want to reference the same folder for any project we make
  description = "folder for the project to live in" 
}

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "name of the vpc" 
}

variable "billing_account" {
  type        = string
  default     = "00976C-63A0B7-F8AB7D"
  description = "billing account for project"
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
  default     = "machine_type"
  description = "VM machine type"
}

variable "zone" {
  type        = string
  default     = "europe-west2-a"
  description = "zone"
}

variable "image_type" {
  type        = string
  default     = "image_type"
  description = "image type" 
}

variable "subnet" {
  type        = string
  default     = "subnet"
  description = "subnet name"
}

variable "cidr_range" {
  type        = string
  default     = "cidr"
  description = "cidr IP range"
}
