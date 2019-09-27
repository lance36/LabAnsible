
# open bash terminal in VSCODE + clone code repository locally
(in vscode) 
terminal --> new terminal 

(in new terminal)  
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
git clone https://github.com/auto-store/lod-ansible-"user#"

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
 you will need to edit a line in the cluster-role.yml "/etc/ansible/lod-ansible/cluster" and add your user number so the playbook finds the right path 
 
 e.g "/etc/ansible/lod-ansible-1/cluster" 

 do the same for the cluster-role-mount-nfs.yml as we will use this later. 

 save the changed file, then use the git integration in VSCODE to commit changes to the repository. (left sidebar, 3rd down) then use a bash shell in the terminal to execute "git push" 

 in the docker container, make sure you are in the repository directory. execute "git pull" to update the repo. then run the playbook that executes the cluster role. 

 ansible-playbook cluster-role.yml 

# run the ONTAP cluster role again then a role to mount an NFS export to RHEL host
ansible-playbook cluster-role-mount-nfs.yml

# customise the cluster role!
create a new SVM, new volume, new lif. use your own name!

# commit changes
save the changed files, then use the git integration in VSCODE to commit changes to the repository. (left sidebar, 3rd down) then use a bash shell in the terminal to execute "git push" 

# run playbook to create your new SVM etc. 
in the docker container, make sure you are in the repository directory. execute "git pull" to update the repo. then run the playbook that executes the cluster role. 

# edit the mount_nfs role to add yourself as a user and mount your export to your home directory
 :) 

# now push all changes to a "production" repo
git remote add origin https://github.com/auto-store/lod-ansible-production.git
git push -u origin master

-------
# extra - encrypt your credentials using ansible vault
use the ansible documentation. 
