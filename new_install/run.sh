#!/usr/bin/bash

sudo apt-get update

sudo apt-get install -y apt-transport-https

sudo apt-get install -y docker.io

sudo systemctl start docker

sudo systemctl enable docker


sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update

sudo apt-get install -y docker.io kubeadm kubectl kubelet

sudo swapoff -a

PUB_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

sudo kubeadm init  --apiserver-advertise-address=$PUB_IP --pod-network-cidr=$PUB_IP/16

