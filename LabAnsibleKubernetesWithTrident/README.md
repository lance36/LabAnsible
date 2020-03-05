############################
## LAB ANSIBLE - FIRST STEPS
############################

# Open bash terminal in VSCODE + clone code repository locally
(in vscode)
    terminal --> new terminal 

(in new terminal)
    cd Documents
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident

# SSH into host3
    ssh root@192.168.0.63
    password: Netapp1!

# Clone the repository in the centos environment
    git clone https://github.com/YvosOnTheHub/LabAnsible.git

# We will create here a specific backend for Trident & a specific StorageClass for this lab (just in case)
    tridentctl -n trident create backend -f 0-Trident-config/backend-ansible.json
    kubectl create -f 0-Trident-config/sc-ansible.yaml

# Create a specific kubernetes namespace for Ansible
    kubectl create namespace ansible

# Create the PVC & Deployment for Ansible
    kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-pvc.yaml
    kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-deployment.yaml

# If you are configuring this lab for the first time, you will have the latest container image available on the Docker Hub.
# If for whatever reason, you need to update the newest image (release of a new collection for instance), it can be achieved using the following command (if using K8S 1.15+)
    kubectl -n ansible rollout restart deploy ansible

# Enter the Ansible pod
    kubectl exec -it -n ansible $(kubectl get pod -n ansible --output=name) -- /bin/bash

# Depending on what lab you want to showcase, you will find the next steps in the following sub-dir
    - 1_Lab_NAS: Create & Mount 2 NFS volumes on 3 hosts
    - 2_Lab_NAS_iSCSI: Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
    - 3_Lab_NAS_SnapMirror: Create, Mount & Mirror 2 NFS volumes