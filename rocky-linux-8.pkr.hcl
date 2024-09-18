packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/openstack"
    }
  }
}


source "openstack" "rocky" {
  identity_endpoint    = var.openstack_auth_url
  username             = var.openstack_username
  password             = var.openstack_password
  tenant_name          = var.openstack_tenant_name
  flavor               = var.flavor
  region               = var.region
  source_image         = var.source_image
  image_name           = local.image-name
  networks             = [var.networks]
  security_groups      = [var.security_groups_name]
  domain_name          = var.domain_name
  ssh_username         = "rocky"
  floating_ip_network  = var.floating_ip_network
  ssh_timeout          = "10m"
  insecure             = "true"
  ssh_private_key_file = "devops-project.pem"
  ssh_keypair_name     = var.ssh_keypair_name
  metadata = {
    "created_by" : "packer-automation"
  }
}

build {
  sources = ["source.openstack.rocky"]

  provisioner "file" {
    source      = "cloud.cfg"
    destination = "/tmp/cloud.cfg"
  }
  provisioner "shell" {
    inline = [
      "sudo mv /tmp/cloud.cfg /etc/cloud/cloud.cfg",
      "sudo dnf update -y"
    ]
  }
}
