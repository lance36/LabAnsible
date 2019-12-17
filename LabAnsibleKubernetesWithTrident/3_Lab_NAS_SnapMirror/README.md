####################################
## ANSIBLE & SNAPMIRROR INTEGRATION
####################################

# Open bash terminal in VSCODE + clone code repository locally
(in vscode) 
    terminal --> new terminal 

(in new terminal)  
    cd Documents
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident

# SSH into host5
    ssh root@192.168.0.66
    password: Netapp1!

# Clone the repository in the centos environment
    git clone https://github.com/YvosOnTheHub/LabAnsible.git

# Create a specific kubernetes namespace for Ansible
    kubectl create namespace ansible

# Create the PVC & Deployment for Ansible
    kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-pvc.yaml
    kubectl create -n ansible -f 0-Kubernetes-config/0-ansible-deployment.yaml

# The upgrade of this deployment can be achieved using the following command (if using K8S 1.15+)
# It will automatically download the latest available image
    kubectl -n ansible rollout restart deploy ansible

# Enter the Ansible pod
    kubectl exec -it -n ansible $(kubectl get pod -n ansible --output=name) -- /bin/bash

=>  you are now in the container

# Clone github repo
    cd /etc/ansible/ 
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident

# Check the version of the NetApp Collection installed (verified with 19.11.0)
    mazer list

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
    ansible-playbook 3_Lab_NAS_SnapMirror/1-install-nfs-utils.yml

# Run "playbook" for single volume just to try it out
    ansible-playbook 3_Lab_NAS_SnapMirror/2-flexvol-create.yml

# Run "role" to configure a new SVM (inspect it in VSCODE to see what it does!)
    ansible-playbook 3_Lab_NAS_SnapMirror/3-svm-role_and_mount-resources.yml 

# Run "role" to remove the mounted resources & delete the SVM
    ansible-playbook 3_Lab_NAS_SnapMirror/4-cleanup.yml 

# Exit the container
    exit

# If you need to also remove the Ansible App from Kubernetes
    kubectl delete deploy ansible -n ansible
    kubectl delete pvc ansible-content -n ansible
    kubectl delete pvc ansible-ssh -n ansible
    kubectl delete namespace ansible

