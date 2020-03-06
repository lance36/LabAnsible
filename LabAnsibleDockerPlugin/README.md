##################################
## LAB ANSIBLE - FIRST STEPS
##################################

### Open bash terminal in VSCODE + clone code repository locally
(in vscode)
```
    terminal --> new terminal 
```

(in new terminal)
```
    cd Documents
    git clone https://github.com/YvosOnTheHub/LabAnsible.git 
    cd LabAnsible/LabAnsibleDockerPlugin/3_Lab_NAS_SnapMirror
```

### SSH into host5
    ssh root@192.168.0.66
    password: Netapp1!

### Clone the repository in the centos environment
    git clone https://github.com/YvosOnTheHub/LabAnsible.git

### Copy the Trident backend file in /etc/netappdvp
    cp ~/LabAnsible/LabAnsibleDockerPlugin/0-Trident-config/config-ontap-nas.json /etc/netappdvp/

### Install Trident as a Docker plugin & check it is active
    docker plugin install netapp/trident-plugin:19.07 --alias ontap-nas --grant-all-permissions config=config-ontap-nas.json 
    docker plugin ls

### Create persistent docker volumes (one local & one on NetApp backend)
    docker volume create ssh-keys 
    docker volume create -d ontap-nas --name ansible -o size=1g 
    docker volume ls 

### Run docker container with NetApp Ansible modules configured
    docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmots1/netapp-ansible /bin/bash

### Depending on what lab you want to showcase, you will find the next steps in the following sub-dir
    - 1_Lab_NAS: Create & Mount 2 NFS volumes on 3 hosts
    - 2_Lab_NAS_iSCSI: Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
    - 3_Lab_NAS_SnapMirror: Create, Mount & Mirror 2 NFS volumes