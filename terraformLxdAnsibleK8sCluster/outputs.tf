# ========== CONTAINER IPS ==========
output "master_ip" {
  description = "Master node IP address"
  value       = lxd_container.k8s-master.ipv4_address
}

output "worker1_ip" {
  description = "Worker 1 node IP address"  
  value       = lxd_container.k8s-worker1.ipv4_address
}

output "worker2_ip" {
  description = "Worker 2 node IP address"
  value       = lxd_container.k8s-worker2.ipv4_address
}

# ========== CONTAINER NAMES ==========
output "master_name" {
  description = "Master node container name"
  value       = lxd_container.k8s-master.name
}

output "worker1_name" {
  description = "Worker 1 node container name"
  value       = lxd_container.k8s-worker1.name
}

output "worker2_name" {
  description = "Worker 2 node container name"
  value       = lxd_container.k8s-worker2.name
}

# ========== ACCESS INFORMATION ==========
output "ssh_access_commands" {
  description = "SSH access commands for all nodes"
  value = {
    master  = "ssh ubuntu@${var.master_ip}"
    worker1 = "ssh ubuntu@${var.worker1_ip}"  
    worker2 = "ssh ubuntu@${var.worker2_ip}"
  }
}

output "port_forwarding_access" {
  description = "Port forwarding access commands"
  value = {
    master_ssh  = "ssh ubuntu@localhost -p ${var.master_ssh_port}"
    worker1_ssh = "ssh ubuntu@localhost -p ${var.worker1_ssh_port}"
    worker2_ssh = "ssh ubuntu@localhost -p ${var.worker2_ssh_port}"
    k8s_api     = "https://localhost:${var.k8s_api_port}"
  }
}

output "lxc_exec_commands" {
  description = "LXC exec commands for direct console access"
  value = {
    master  = "lxc exec ${var.master_name} -- /bin/bash"
    worker1 = "lxc exec ${var.worker1_name} -- /bin/bash"
    worker2 = "lxc exec ${var.worker2_name} -- /bin/bash"
  }
}

# ========== ANSIBLE INVENTORY ==========
output "ansible_inventory" {
  description = "Ansible inventory format"
  value = <<-EOT
[k8s_masters]
${var.master_name} ansible_host=${var.master_ip} ansible_user=ubuntu

[k8s_workers]  
${var.worker1_name} ansible_host=${var.worker1_ip} ansible_user=ubuntu
${var.worker2_name} ansible_host=${var.worker2_ip} ansible_user=ubuntu

[k8s_cluster:children]
k8s_masters
k8s_workers

[k8s_cluster:vars]
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
  EOT
}

# ========== SUMMARY ==========
output "cluster_summary" {
  description = "Kubernetes cluster summary"
  value = <<-EOT
=== Kubernetes LXD Cluster ===
Master Node:  ${var.master_ip} (${var.master_name})
Worker 1:     ${var.worker1_ip} (${var.worker1_name})
Worker 2:     ${var.worker2_ip} (${var.worker2_name})

Network: ${var.network_cidr}
Gateway: ${var.network_gateway}

=== Quick Commands ===
Check containers: lxc list
Master console:   lxc exec ${var.master_name} -- /bin/bash
SSH to master:    ssh ubuntu@${var.master_ip}
  EOT
}