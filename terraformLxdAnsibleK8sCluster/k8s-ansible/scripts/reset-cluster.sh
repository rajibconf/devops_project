#!/bin/bash

echo "Resetting Kubernetes cluster..."

# Reset all nodes
ansible k8s_cluster -i inventory.ini -m shell -a "kubeadm reset --force" -b

echo "Cluster reset completed!"