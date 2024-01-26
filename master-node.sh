#!/bin/bash

echo "----------------------------------------------------"
echo "            UPDATE THE SYSTEM                       "
echo "----------------------------------------------------"

sudo apt-get update -y

echo "----------------------------------------------------"
echo "            INSTALL GIT AND CURL                    "
echo "----------------------------------------------------"

sudo apt-get install git curl -y

echo "----------------------------------------------------"
echo "            K8S TOOLS INSTALLATION                  "
echo "----------------------------------------------------"

sudo git clone https://github.com/ahilleulrich/cka
cd cka
sudo ./setup-container.sh
sudo ./setup-kubetools.sh
sudo kubeadm init
sleep 5
cd
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml -O

echo "----------------------------------------------------"
echo "            CALICO NETWORK INSTALLATION              "
echo "----------------------------------------------------"

kubectl apply -f calico.yaml
