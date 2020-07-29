
### SSH into "Rhel5"

```bash
ssh root@192.168.0.66
password: Netapp1!
```

### Create persistent docker volumes

```bash
docker volume create ssh-keys
docker volume create ansible
```

### Run docker container

```bash
docker run -it -v ansible:/etc/ansible -v ssh-keys:/root/.ssh schmots1/netapp-ansible /bin/bash
```

=>  you are now in the container

### Clone github repo

```bash
cd /etc/ansible
git clone https://github.com/YvosOnTheHub/LabAnsible.git
cd LabAnsible/LabAnsibleDockerSimple
```

### Create and share ssh-keys with remote RHEL host

```bash
ssh-keygen 
ssh-copy-id root@192.168.0.64
ssh-copy-id root@192.168.0.66
ssh-copy-id root@192.168.0.69
```

### Copy hosts file to correct directory

```bash
cp hosts /etc/ansible/
```

### Ping host to check connectivity with RHEL host 

```bash
ansible -m ping rhel
```

### Install NFS utils on RHEL Host with ansible playbook  (change into repository directory!)

```bash
ansible-playbook 0-install-nfs-utils.yml
```

### Run playbook for single volume

```bash
ansible-playbook 1-flexvol-create.yml
```

### Run the ONTAP cluster role then a role to mount an NFS export to RHEL host

```bash
ansible-playbook 2-cluster-role-mount-nfs.yml
```

### Run "role" to remove the mounted resources & delete the SVM

```bash
ansible-playbook 3-cleanup.yml
```
