#!/bin/bash

echo "#######################################################################################################"
echo "Add a specific backend & a specific storage class for Ansible"
echo "#######################################################################################################"

tridentctl -n trident create backend -f 0-Trident-config/backend-ansible.json
kubectl create -f 0-Trident-config/sc-ansible.yaml

echo "#######################################################################################################"
echo "Create a namespace for Ansible"
echo "#######################################################################################################"

kubectl create namespace ansible

echo "#######################################################################################################"
echo "Create the PVC & Deployment for Ansible"
echo "#######################################################################################################"

kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-pvc.yaml
kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-deployment.yaml

echo "#######################################################################################################"
echo "Add a new shortcut"
echo "#######################################################################################################"

cat <<EOT >> ~/.bashrc
alias kansible='kubectl exec -it -n ansible $(kubectl get pod -n ansible --output=name) -- /bin/bash'
EOT
bash

echo "#######################################################################################################"
echo "Check"
echo "#######################################################################################################"

kubectl get -n ansible pod --watch