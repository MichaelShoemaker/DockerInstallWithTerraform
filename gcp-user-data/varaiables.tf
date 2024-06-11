
# variable "credentials" {
#   description = "My Credentials"
#   default     = "<Path to your Service Account json file>"
# }


variable "project" {
  description = "Project"
  default     = "kestra-demo"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "zone" {
    description = "Zone"
    default = "us-central1-a"
}
