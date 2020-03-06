
### Open bash terminal in VSCODE + clone code repository locally
(in vscode)
```
terminal --> new terminal 
```

(in new terminal)
```
    cd Documents
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleDockerSimple
```

### SSH into "Rhel5"
    ssh root@192.168.0.66   
    password: Netapp1!

### Create persistent docker volumes
    docker volume create ssh-keys
    docker volume create ansible

### Run docker container
    docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmots1/netapp-ansible /bin/bash

=>  you are now in the container

### Clone github repo
    cd /etc/ansible
    git clone https://github.com/YvosOnTheHub/LabAnsible.git
    cd LabAnsible/LabAnsibleDockerSimple

### Create and share ssh-keys with remote RHEL host
    ssh-keygen 
    ssh-copy-id root@192.168.0.64
    ssh-copy-id root@192.168.0.66
    ssh-copy-id root@192.168.0.69

### Copy hosts file to correct directory
    cp hosts /etc/ansible/

### Ping host to check connectivity with RHEL host 
    ansible -m ping rhel

### Install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
    ansible-playbook 0-install-nfs-utils.yml

### Run playbook for single volume
    ansible-playbook 1-flexvol-create.yml

### Run the ONTAP cluster role then a role to mount an NFS export to RHEL host
    ansible-playbook 2-cluster-role-mount-nfs.yml

### Run "role" to remove the mounted resources & delete the SVM
    ansible-playbook 3-cleanup.yml 