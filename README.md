# install vscode 

# open terminal + clone code repository 
terminal --> new terminal 


# ssh into "Rhel5"
ssh root@192.168.0.66   
password: Netapp1!

# create persistent docker volumes
docker volume create ssh-keys
docker volume create ansible

# Run docker container
docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmot1/netapp-ansible 

# create ansible directorys
mkdir /etc/ansible/roles

# clone github repo
cd /etc/ansible
git clone https://github.com/auto-store/lod-ansible 

# run playbook for single volume 
ansible-playbook flexvol-create.yml

# run ansible role
ansible-playbook lod-ansible.yml 


