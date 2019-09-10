# lod-ansible
Hands on session for LOD 

# create persistent docker volume

docker volume create ssh-keys 

# Run docker container

docker run -it -v ssh-keys:/root/.ssh schmot1/netapp-ansible 

# create ansible directorys

mkdir /etc/ansible
mkdir /etc/ansible/roles
mkdir /etc/ansible/playbooks

# clone github repos

cd /etc/ansible/roles
git clone https://github.com/auto-store/lod-ansible 

# run playbook for single volume 

ansible-playbook flexvol-create.yml

# run ansible role

ansible-playbook lod-ansible.yml 


