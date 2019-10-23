################
## LAB ANSIBLE
################

This lab is entended to test NetApp Ansible modules.
The variables used in this repo correspond to the NetApp Lab on Demand "Using NetApp with Docker and Kubernetes v2.0"

The goal here is to create & configure a tenant (ie a SVM) on the ONTAP cluster, and mounts resources on several servers.

Scenarios
---------
1. Use Ansible as simple Docker Container
2. Use Ansible as a Docker Container, which mounts a persistent volume with Trident for Docker
   - Create & Mount 2 NFS volumes on 3 hosts
   - Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
   - Create, Mounts & Mirrors 2 NFS volumes 
3. Use Ansible as a Kubernetes App with a PVC to host these playbooks
   - Create & Mount 2 NFS volumes on 3 hosts
   - Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
   - Create, Mounts & Mirrors 2 NFS volumes 