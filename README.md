

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

# create and share ssh-keys with remote RHEL host
ssh-keygen 
ssh-copy-id root@192.168.0.69

# copy hosts file to correct directory
cp /etc/ansible/lod-ansible-"user"/hosts /etc/ansible/

# ping host to check connectivity with RHEL host 
ansible -m ping rhel

# install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)
ansible-playbook install-nfs-utils.yml

# run playbook for single volume
change into repo directory ---> cd lod-ansible-"user"
ansible-playbook flexvol-create.yml

# run role to configure ONTAP cluster (insepct it in VSCODE to see what it does!)
ansible-playbook cluster-role.yml 

# run the ONTAP cluster role and then a role to mount NFS export to RHEL host
ansible-playbook cluster-role-mount-nfs.yml

