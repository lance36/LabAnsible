####################################
## ANSIBLE & NETAPP ROLES
####################################

=>  you are now in the container

### Clone github repo

```bash
cd /etc/ansible/ 
git clone https://github.com/YvosOnTheHub/LabAnsible.git 
cd LabAnsible/LabAnsibleKubernetesWithTrident
```

### Check the version of the NetApp Collection installed

```bash
more /usr/share/ansible/collections/ansible_collections/netapp/ontap/MANIFEST.json | grep version
```

### If an upgrade of the collection is required, run the following

```bash
ansible-galaxy collection install netapp.ontap
```

### Use NetApp roles to create & configure an SVM

```bash
ansible-playbook 4_Lab_NetApp_Roles/SVM_setup.yml
```

### Cleanup the environment

```bash
ansible-playbook 4_Lab_NetApp_Roles/SVM_cleanup.yml 
```

### Exit the container

```bash
exit
```

### If you need to also remove the Ansible App from Kubernetes, simply delete the namespace

```bash
kubectl delete namespace ansible
```
