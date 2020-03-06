##########################################
## ANSIBLE & NFS+iSCSI INTEGRATION
##########################################

=>  you are now in the container

### Clone github repo
    cd /etc/ansible/ 
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident

### Check the version of the NetApp Collection installed (works with ansible 2.8 maximum)
    mazer list

### Create and share ssh-keys with remote RHEL host (for instance "Rhel4", "Rhel5", "Rhel6")
    ssh-keygen (keep the default values for all inputs, ie press 'enter' a few times)
    ssh-copy-id root@192.168.0.64
    ssh-copy-id root@192.168.0.66
    ssh-copy-id root@192.168.0.69

### Copy hosts file to correct directory
    cp hosts /etc/ansible/

### Ping host to check connectivity with RHEL host 
    ansible -m ping rhel

### Make sure the ONTAP IP addresses to use are free. If the result of the following is 0, you are good to go
    ansible -m ping ontap_lab_nas_iscsi | grep SUCCESS | wc -l

### Install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
    ansible-playbook 2_Lab_NAS_iSCSI/1-install-nfs-utils.yml

### Run "playbook" for single volume just to try it out
    ansible-playbook 2_Lab_NAS_iSCSI/2-flexvol-create.yml

### Run "role" to configure a new SVM (inspect it in VSCODE to see what it does!)
    ansible-playbook 2_Lab_NAS_iSCSI/3-svm-role_and_mount-resources.yml 

### Run "role" to remove the mounted resources & delete the SVM
    ansible-playbook 2_Lab_NAS_iSCSI/4-cleanup.yml 

### Exit the container
    exit

### If you need to also remove the Ansible App from Kubernetes, simply delete the namespace
    kubectl delete namespace ansible