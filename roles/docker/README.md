## prerequisite
Run on CentOS 7.2 and have admin privilege

## Parameter
tasks/main.yml: <type> ## this parameter need to write when run ansible-playbook; value must one of "offline","online"
tasks/offline.yml: <hostname>,<ip> ## these can auto get from ansible
tasks/online.yml: <hostname>,<ip> ## these can auto get from ansible

## Goals
Install docker-ce, star docker and enable docker.service
Modify Linux DNS configure file
Add Linux localhost in hosts
#Run docker rancher agent command
 
## Author
Create by <iris.li@gymboglobal.com> 201809013
