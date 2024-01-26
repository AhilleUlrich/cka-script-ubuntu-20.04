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

