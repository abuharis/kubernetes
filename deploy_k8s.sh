#!/bin/bash

echo "Step0: Meet the prerequisites"
bash pre/requisites.sh

echo "Step1: Install Docker Engine"
bash docker/install.sh

echo "Step2: Install cri-dockerd adapter to act as shim between docker and k8s"
bash adapter/cri-dockerd.sh

