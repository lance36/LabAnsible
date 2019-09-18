

# open terminal + clone code repository locally
terminal --> new terminal 

cd Documents
git clone https://github.com/auto-store/lod-ansible

# ssh into "Rhel5"
ssh root@192.168.0.66   
password: Netapp1!

# create persistent docker volumes
docker volume create ssh-keys
docker volume create ansible

# Run docker container
docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmot1s/netapp-ansible /bin/bash

# clone github repo
cd /etc/ansible
git clone https://github.com/auto-store/lod-ansible-"user"

# create and share ssh-keys with remote host
ssh-keygen 
ssh-copy-id root@192.168.0.69

# copy hosts file to correct directory
cp /etc/ansible/lod-ansible-"user"/hosts /etc/ansible/

# run playbook for single volume
change into repo directory ---> cd lod-ansible-"user"
ansible-playbook flexvol-create.yml

# run ansible role
ansible-playbook cluster-role.yml 


