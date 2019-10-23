####################################
## ANSIBLE & SNAPMIRROR INTEGRATION
####################################

# Open bash terminal in VSCODE + clone code repository locally
(in vscode) 
    terminal --> new terminal 

(in new terminal)  
    cd Documents
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident_NAS_SnapMirror

# SSH into host5
    ssh root@192.168.0.66
    password: Netapp1!

# Clone the repository in the centos environment
    git clone https://github.com/YvosOnTheHub/LabAnsible.git

# Create a specific kubernetes namespace for Ansible
    kubectl create namespace ansible

# Create the PVC & Deployment for Ansible
    kubectl create -n ansible -f 0-ansible-pvc.yaml
    kubectl create -n ansible -f 0-ansible-deployment.yaml
    kubectl get pod -n ansible
    (write down the pod name)

# Enter the Ansible pod
    kubectl exec -it -n ansible $(kubectl get pod -n ansible --output=name) -- /bin/bash

=>  you are now in the container

# Clone github repo
    cd /etc/ansible/ 
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident_NAS_SnapMirror

# Create and share ssh-keys with remote RHEL host (for instance "Rhel4", "Rhel5", "Rhel6")
    ssh-keygen (keep the default values for all inputs, ie press 'enter' a few times)
    ssh-copy-id root@192.168.0.64
    ssh-copy-id root@192.168.0.66
    ssh-copy-id root@192.168.0.69

# Copy hosts file to correct directory
    cp hosts /etc/ansible/

# Ping host to check connectivity with RHEL host 
    ansible -m ping rhel

# Make sure the ONTAP IP addresses to use are free. If the result of the following is 0, you are good to go
    ansible -m ping ontap_lab_snapmirror | grep SUCCESS | wc -l

# Install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
    ansible-playbook 1-install-nfs-utils.yml

# Run "playbook" for single volume just to try it out
    ansible-playbook 2-flexvol-create.yml

# Run "role" to configure a new SVM (inspect it in VSCODE to see what it does!)
    ansible-playbook 3-svm-role_and_mount-resources.yml 

# Run "role" to remove the mounted resources & delete the SVM
    ansible-playbook 4-cleanup.yml 

# Exit the container
    exit

