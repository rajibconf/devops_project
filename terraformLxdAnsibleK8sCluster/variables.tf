# ========== GENERAL CONFIGURATION ==========
variable "ubuntu_image" {
  description = "Ubuntu image for containers"
  type        = string
  default     = "ubuntu:24.04"
}

variable "bridge_name" {
  description = "LXD bridge name"
  type        = string
  default     = "lxdbr0"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# ========== MASTER NODE CONFIGURATION ==========
variable "master_name" {
  description = "Master node container name"
  type        = string
  default     = "k8s-master"
}

variable "master_ip" {
  description = "Master node IP address"
  type        = string
  default     = "10.31.25.10"
}

variable "master_cpu" {
  description = "Master node CPU limit"
  type        = string
  default     = "2"
}

variable "master_memory" {
  description = "Master node memory limit"
  type        = string
  default     = "2GB"
}

variable "master_ssh_port" {
  description = "Master node SSH port forwarding"
  type        = number
  default     = 2201
}

variable "k8s_api_port" {
  description = "Kubernetes API port"
  type        = number
  default     = 6443
}

# ========== WORKER NODES CONFIGURATION ==========
variable "worker1_name" {
  description = "Worker 1 node container name"
  type        = string
  default     = "k8s-worker1"
}

variable "worker1_ip" {
  description = "Worker 1 node IP address"
  type        = string
  default     = "10.31.25.11"
}

variable "worker2_name" {
  description = "Worker 2 node container name"
  type        = string
  default     = "k8s-worker2"
}

variable "worker2_ip" {
  description = "Worker 2 node IP address"
  type        = string
  default     = "10.31.25.12"
}

variable "worker_cpu" {
  description = "Worker nodes CPU limit"
  type        = string
  default     = "2"
}

variable "worker_memory" {
  description = "Worker nodes memory limit"
  type        = string
  default     = "2GB"
}

variable "worker1_ssh_port" {
  description = "Worker 1 SSH port forwarding"
  type        = number
  default     = 2202
}

variable "worker2_ssh_port" {
  description = "Worker 2 SSH port forwarding"
  type        = number
  default     = 2203
}

# ========== NETWORK CONFIGURATION ==========
variable "network_cidr" {
  description = "Network CIDR for containers"
  type        = string
  default     = "10.31.25.0/24"
}

variable "network_gateway" {
  description = "Network gateway"
  type        = string
  default     = "10.31.25.1"
}