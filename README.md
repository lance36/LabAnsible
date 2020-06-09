###################
## LAB ANSIBLE
###################

This lab is entended to test NetApp Ansible modules.
The variables used in this repo correspond to following NetApp Lab on Demand:
   - "Using Trident with Kubernetes and ONTAP v3.1"

The playbooks you are about to run use the NetApp Collection available on Ansible Galaxy.
This lab has been tested & validated with the schmots1/ansible image v15 (March 2020).

The goal here is to create & configure a tenant (ie a SVM) on the ONTAP cluster, and mounts resources on several servers.

Scenarios
---------  
[1.](LabAnsibleKubernetesWithTrident) Use Ansible as a Kubernetes App with a PVC to host these playbooks (*PREFERRED*)
   - Create & Mount 2 NFS volumes on 3 hosts
   - Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
   - Create, Mount & Mirror 2 NFS volumes 
   - Use NetApp's Ansible roles to create & configure a SVM  

[2.](LabAnsibleDockerPlugin) Use Ansible as a Docker Container, which mounts a persistent volume with Trident for Docker
   - Create & Mount 2 NFS volumes on 3 hosts
   - Create & Mount NFS volumes & iSCSI LUNs on 3 hosts
   - Create, Mount & Mirror 2 NFS volumes  

[3.](LabAnsibleDockerSimple) Use Ansible as simple Docker Container  

NB: if you do not know much about Kubernetes, do not be afraid to give a shout to the third chapter.
Everything is described in a step by step fashion.