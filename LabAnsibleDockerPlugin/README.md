
# open bash terminal in VSCODE + clone code repository locally
(in vscode) 
terminal --> new terminal 

(in new terminal)  
cd Documents
git clone https://github.com/YvosOnTheHub/LabAnsible.git 
cd LabAnsible/LabAnsibleDockerPlugin

# ssh into host5
ssh root@192.168.0.66
password: Netapp1!

# clone the repository in the centos environment
git clone https://github.com/YvosOnTheHub/LabAnsible.git

# copy the Trident backend file in /etc/netappdvp
cp ~/LabAnsible/LabAnsibleDockerPlugin/0-Trident-config/config-ontap-nas.json /etc/netappdvp/

# install Trident as a Docker plugin & check it is active
docker plugin install netapp/trident-plugin:18.07 --alias ontap-nas --grant-all-permissions config=config-ontap-nas.json 
docker plugin ls

# create persistent docker volumes (one local & one on NetApp backend)
docker volume create ssh-keys 
docker volume create -d ontap-nas --name ansible -o size=1g 
docker volume ls 

# Run docker container with NetApp Ansible modules configured
docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmots1/netapp-ansible /bin/bash

### you are now in the container

# clone github repo
cd /etc/ansible/ 
git clone https://github.com/YvosOnTheHub/LabAnsible.git 
cd LabAnsible/LabAnsibleDockerPlugin 

# create and share ssh-keys with remote RHEL host (for instance "Rhel4", "Rhel5", "Rhel6")
ssh-keygen (keep the default values for all inputs, ie press 'enter' a few times)
ssh-copy-id root@192.168.0.64
ssh-copy-id root@192.168.0.66
ssh-copy-id root@192.168.0.69

# copy hosts file to correct directory
cp hosts /etc/ansible/

# ping host to check connectivity with RHEL host 
ansible -m ping rhel

# install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
ansible-playbook 1-install-nfs-utils.yml

# run playbook for single volume just to try it out
ansible-playbook 2-flexvol-create.yml

# run role to configure a new SVM (inspect it in VSCODE to see what it does!)
ansible-playbook 3-svm-role_and_mount-resources.yml 

# run role to remove the mounted resources & delete the SVM
ansible-playbook 4-cleanup.yml 


