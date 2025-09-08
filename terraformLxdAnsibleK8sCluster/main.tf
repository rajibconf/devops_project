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
  name  = var.master_name
  image = var.ubuntu_image

  config = {
    "limits.cpu"    = var.master_cpu
    "limits.memory" = var.master_memory

    "user.user-data" = templatefile("${path.module}/cloud-init/master.yml", {
      hostname = var.master_name
      ssh_key  = trimspace(file(var.ssh_public_key_path))
    })
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype        = "bridged"
      parent         = var.bridge_name
      "ipv4.address" = var.master_ip
    }
  }

  # SSH Port forwarding
  device {
    name = "ssh-proxy"
    type = "proxy"
    properties = {
      listen  = "tcp:0.0.0.0:${var.master_ssh_port}"
      connect = "tcp:127.0.0.1:22"
    }
  }

  # Kubernetes API Port forwarding
  device {
    name = "k8s-api-proxy"
    type = "proxy"
    properties = {
      listen  = "tcp:0.0.0.0:${var.k8s_api_port}"
      connect = "tcp:127.0.0.1:6443"
    }
  }
}

# ========== WORKER NODE 1 ==========
resource "lxd_container" "k8s-worker1" {
  name  = var.worker1_name
  image = var.ubuntu_image

  config = {
    "limits.cpu"    = var.worker_cpu
    "limits.memory" = var.worker_memory

    "user.user-data" = templatefile("${path.module}/cloud-init/worker.yml", {
      hostname = var.worker1_name
      ssh_key  = trimspace(file(var.ssh_public_key_path))
    })
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype        = "bridged"
      parent         = var.bridge_name
      "ipv4.address" = var.worker1_ip
    }
  }

  # SSH Port forwarding
  device {
    name = "ssh-proxy"
    type = "proxy"
    properties = {
      listen  = "tcp:0.0.0.0:${var.worker1_ssh_port}"
      connect = "tcp:127.0.0.1:22"
    }
  }
}

# ========== WORKER NODE 2 ==========
resource "lxd_container" "k8s-worker2" {
  name  = var.worker2_name
  image = var.ubuntu_image

  config = {
    "limits.cpu"    = var.worker_cpu
    "limits.memory" = var.worker_memory

    "user.user-data" = templatefile("${path.module}/cloud-init/worker.yml", {
      hostname = var.worker2_name
      ssh_key  = trimspace(file(var.ssh_public_key_path))
    })
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype        = "bridged"
      parent         = var.bridge_name
      "ipv4.address" = var.worker2_ip
    }
  }

  # SSH Port forwarding
  device {
    name = "ssh-proxy"
    type = "proxy"
    properties = {
      listen  = "tcp:0.0.0.0:${var.worker2_ssh_port}"
      connect = "tcp:127.0.0.1:22"
    }
  }
}