output "master_ip" {
  value = lxd_container.k8s-master.ipv4_address
}

output "worker1_ip" {
  value = lxd_container.k8s-worker1.ipv4_address
}

output "worker2_ip" {
  value = lxd_container.k8s-worker2.ipv4_address
}
