#!/bin/bash

echo "Starting Kubernetes cluster deployment..."

# Run the main playbook
ansible-playbook -i inventory.ini site.yml

echo "Deployment completed!"
echo "To access the cluster, SSH to the master node and use kubectl"
echo "Example: ssh ubuntu@10.31.25.20"
echo "Then run: kubectl get nodes"