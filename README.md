# LAB ANSIBLE

This lab is entended to test NetApp Ansible modules.
The variables used in this repo correspond to the NetApp Lab on Demand "Using NetApp with Docker and Kubernetes v2.0"

The goal here is to create & configure a tenant (ie a SVM) on the ONTAP cluster, and mounts resources on several servers.

Scenarios
---------
1. Use Ansible as simple Docker Container
2. Use Ansible as a Docker Container, which mounts a persistent volume with Trident for Docker
3. Use Ansible as a Kubernetes App, with PVC managed with Trident