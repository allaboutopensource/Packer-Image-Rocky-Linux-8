variable "openstack_auth_url" {
  description = "Name of the user/service account which is trying to connect to openstack cloud"
  type        = string
  default     = env("OS_AUTH_URL")
}

variable "openstack_username" {
  description = "Name of the user/service account which is trying to connect to openstack cloud"
  type        = string
  default     = "sunilka"
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
  description = "flavor for the project"
  type        = string
  default     = "iadprod"
}


variable "networks" {
  description = "Network ID where you want resoures to be created"
  default     = "ee102258-a15e-4065-813c-f8a11cf522dc"
}

variable "security_groups_name" {
  description = "Security group name/ID for the project"
  type        = string
  default     = "itops-infra"
}


variable "domain_name" {
  description = "Security group name/ID for the project"
  type        = string
  default     = env("OS_USER_DOMAIN_NAME")
}

variable "floating_ip_network" {
  description = "Network ID where you want resoures to be created"
  default     = "26c6d7c3-298f-46eb-9d73-7a84bc1a787b"
}

variable "ssh_keypair_name" {
  description = "Keypair for the project"
  type        = string
  default     = "itops-infra-project"
}


variable "source_image" {
  description = "Image ID/Name where you want resoures to be created"
  default     = "d940bc05-7f88-4674-8409-ead1807d951c"
}


locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image-name      = "Openstack Rocky Linux 8-${local.image-timestamp}"
}
