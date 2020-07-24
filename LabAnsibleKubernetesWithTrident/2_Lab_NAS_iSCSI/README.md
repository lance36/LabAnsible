##########################################
## ANSIBLE & NFS+iSCSI INTEGRATION
##########################################

=>  you are now in the container

### Clone github repo

```bash
cd /etc/ansible/ 
git clone https://github.com/YvosOnTheHub/LabAnsible.git 
cd LabAnsible/LabAnsibleKubernetesWithTrident
```

### Check the version of the NetApp Collection installed

##### With Ansible 2.8 max

```bash
mazer list
```

##### Starting with Ansible Collections (Ansible 2.9 min)

```bash
more /usr/share/ansible/collections/ansible_collections/netapp/ontap/MANIFEST.json | grep version
```

### If an upgrade of the collection is required, run the following

```bash
ansible-galaxy collection install netapp.ontap
```

### Create and share ssh-keys with remote RHEL host (for instance "Rhel4", "Rhel5", "Rhel6")

```bash
ssh-keygen (keep the default values for all inputs, ie press 'enter' a few times)
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

### Make sure the ONTAP IP addresses to use are free. If the result of the following is 0, you are good to go

```bash
ansible -m ping ontap_lab_nas_iscsi | grep SUCCESS | wc -l
```

### Install NFS utils on RHEL Host with ansible playbook

```bash
ansible-playbook 2_Lab_NAS_iSCSI/1-install-nfs-utils.yml
```

### Run "playbook" for single volume just to try it out

```bash
ansible-playbook 2_Lab_NAS_iSCSI/2-flexvol-create.yml
```

### Run "role" to configure a new SVM (inspect it in VSCODE to see what it does!)

```bash
ansible-playbook 2_Lab_NAS_iSCSI/3-svm-role_and_mount-resources.yml 
```

### Run "role" to remove the mounted resources & delete the SVM

```bash
ansible-playbook 2_Lab_NAS_iSCSI/4-cleanup.yml 
```

### Exit the container

```bash
exit
```

### If you need to also remove the Ansible App from Kubernetes, simply delete the namespace

```bash
kubectl delete namespace ansible
```