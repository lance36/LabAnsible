####################################
## ANSIBLE & NETAPP ROLES
####################################

=>  you are now in the container

### Clone github repo
    cd /etc/ansible/ 
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleKubernetesWithTrident


### Check the version of the NetApp Collection installed
##### With Ansible 2.8 max
    mazer list
##### Starting with Ansible Collections (Ansible 2.9 min)
    more /root/.ansible/collections/ansible_collections/netapp/ontap/MANIFEST.json | grep version

### If an upgrade of the collection is required, run the following
    ansible-galaxy collection install netapp.ontap

### Use NetApp roles to create & configure an SVM
    ansible-playbook 4_Lab_NetApp_Roles/SVM_setup.yml

### Cleanup the environment
    ansible-playbook 4_Lab_NetApp_Roles/SVM_cleanup.yml 

### Exit the container
    exit

### If you need to also remove the Ansible App from Kubernetes, simply delete the namespace
    kubectl delete namespace ansible

