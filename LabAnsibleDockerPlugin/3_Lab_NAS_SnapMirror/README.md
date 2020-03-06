##########################################
## ANSIBLE & SNAPMIRROR INTEGRATION
##########################################

=>  you are now in the container

### Clone github repo
    cd /etc/ansible/ 
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleDockerPlugin


### Check the version of the NetApp Collection installed
##### With Ansible 2.8 max
    mazer list
##### Starting with Ansible Collections (Ansible 2.9 min)
    more /root/.ansible/collections/ansible_collections/netapp/ontap/MANIFEST.json | grep version

### If an upgrade of the collection is required, run the following
    ansible-galaxy collection install netapp.ontap



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
    ansible -m ping ontap_lab_snapmirror | grep SUCCESS | wc -l

### Install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
    ansible-playbook 3_Lab_NAS_SnapMirror/1-install-nfs-utils.yml

### Run "playbook" for single volume just to try it out
    ansible-playbook 3_Lab_NAS_SnapMirror/2-flexvol-create.yml

### Run "role" to configure a new SVM (inspect it in VSCODE to see what it does!)
    ansible-playbook 3_Lab_NAS_SnapMirror/3-svm-role_and_mount-resources.yml 

### Run "role" to remove the mounted resources & delete the SVM
    ansible-playbook 3_Lab_NAS_SnapMirror/4-cleanup.yml 

### Exit the container
    exit
