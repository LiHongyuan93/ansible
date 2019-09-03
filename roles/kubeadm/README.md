## prerequisite
Run on CentOS 7.2 and have admin privilege

## Parameter
* tasks/main.yml: <type> ## this parameter need to write when run ansible-playbook; value must one of "offline","online"
* tasks/offline.yml: <hostname>,<ip> ## these can auto get from ansible
* tasks/online.yml: <hostname>,<ip> ## these can auto get from ansible

## Goals
* Disable firewall
* Deny selinux
* Deny swap
* Install kubeadm, kubelet and kubectl
* Depoly K8S master/work
* Install network plug-in
* Install docker storage

## How to invoke this role
* cd xxx/ansible_deploy
* more xxx to find how to run
 
## Author
Create by LiHongyuan <iris.li@gymboglobal.com> 2019/08/29
