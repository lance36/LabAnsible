# LAB ANSIBLE

This lab is entended to test NetApp Ansible modules.
The variables used in this repo correspond to the NetApp Lab on Demand "Using NetApp with Docker and Kubernetes v2.0"

The goal here is to create & configure a tenant (ie a SVM) on the ONTAP cluster, and mounts resources on several servers.

Scenarios
---------
1. Use Ansible as simple Docker Container
2. Use Ansible as a Docker Container, which mounts a persistent volume with Trident for Docker
2.1 Create & Mount 2 NFS volumes on 3 hosts
2.2 Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
2.3 Create, Mounts & Mirrors 2 NFS volumes 
3. Use Ansible as a Kubernetes App