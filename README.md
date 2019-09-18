

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

# create ansible directorys
mkdir /etc/ansible/roles

# clone github repo
cd /etc/ansible/roles
git clone https://github.com/auto-store/lod-ansible 

# run playbook for single volume 
ansible-playbook flexvol-create.yml

# run ansible role
ansible-playbook lod-ansible.yml 


