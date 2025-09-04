terraform {
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "1.8.0"
    }
  }
}

provider "lxd" {
  accept_remote_certificate = true
  generate_client_certificates = true
}

# ========== MASTER NODE ==========
resource "lxd_container" "k8s-master" {
  name  = "k8s-master"
  image = "ubuntu:22.04"

  config = {
    "limits.cpu"    = "2"
    "limits.memory" = "2GB"

    "user.user-data" = <<-EOT
      #cloud-config
      hostname: k8s-master
      package_update: true
      package_upgrade: true
      packages:
        - curl
        - apt-transport-https
        - ca-certificates
        - vim
    EOT
  }

}

# ========== WORKER NODE 1 ==========
resource "lxd_container" "k8s-worker1" {
  name  = "k8s-worker1"
  image = "ubuntu:22.04"

  config = {
    "limits.cpu"    = "2"
    "limits.memory" = "2GB"

    "user.user-data" = <<-EOT
      #cloud-config
      hostname: k8s-worker1
      package_update: true
      package_upgrade: true
      packages:
        - curl
        - apt-transport-https
        - ca-certificates
        - vim
    EOT
  }

}

# ========== WORKER NODE 2 ==========
resource "lxd_container" "k8s-worker2" {
  name  = "k8s-worker2"
  image = "ubuntu:22.04"

  config = {
    "limits.cpu"    = "2"
    "limits.memory" = "2GB"

    "user.user-data" = <<-EOT
      #cloud-config
      hostname: k8s-worker2
      package_update: true
      package_upgrade: true
      packages:
        - curl
        - apt-transport-https
        - ca-certificates
        - vim
    EOT
  }

}
