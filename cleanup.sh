#!/bin/bash
set -xe

sudo kubeadm reset
sudo rm -rf /var/lib/contrail
sudo mkdir -pm 777 /var/lib/contrail/kafka-logs
rm -rf ~/.kube 
sudo cp -r ~/etcd/ /etc/kubernetes/pki/
sudo cp -r ~/pki/* /etc/kubernetes/pki/