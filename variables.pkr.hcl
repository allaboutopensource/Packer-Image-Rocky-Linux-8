variable "openstack_auth_url" {
  description = "API endpoint to connect to openstack cloud"
  type        = string
  default     = env("OS_AUTH_URL")
}

variable "openstack_username" {
  description = "Name of the user/service account which is trying to connect to openstack cloud"
  type        = string
  default     = "devops"
}

variable "openstack_password" {
  description = "password for user/service account"
  type        = string
  default     = env("OS_PASSWORD")
}

variable "openstack_tenant_name" {
  description = "Project ID/Name where you want resoures to be created"
  type        = string
  default     = env("OS_PROJECT_NAME")
}

variable "flavor" {
  description = "flavor for the project"
  type        = string
  default     = "c2.large"
}

variable "region" {
  description = "Region for the project"
  type        = string
  default     = "cloud-prod"
}


variable "networks" {
  description = "Network ID where you want resoures to be created"
  default     = "edsfsdfddfg123c-f8a11cf522dc"
}

variable "security_groups_name" {
  description = "Security group name/ID for the project"
  type        = string
  default     = "devops-infra"
}


variable "domain_name" {
  description = "domain Name for the project"
  type        = string
  default     = env("OS_USER_DOMAIN_NAME")
}

variable "floating_ip_network" {
  description = "Network ID where you want resoures to be created"
  default     = "26c6sdsdf-123sdv3-298f-46eb-9d73-7asdfds1a787b"
}

variable "ssh_keypair_name" {
  description = "Keypair for the project"
  type        = string
  default     = "devops-infra"
}


variable "source_image" {
  description = "Image ID/Name from where you will pick the image"
  default     = "d94sadsd05-7fsdsd8-4674-8409-sdfdsfsdfsdf"
}


locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image-name      = "Openstack Rocky Linux 8-${local.image-timestamp}"
}
