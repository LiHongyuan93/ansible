## configure zabbix agent on target host to listen performance of the machine
## Note: this role run on Linux machines

## Parameters:
## - templates/zabbix_agentd_[offline|online].conf:
##   	server=172.16.13.113				## the "172.16.13.113" is offline zabbix server IP,"10.0.4.3" is online server
##	ServerActive=172.16.13.142
## 	Hostname="{{ ansible_hostname }}" 		## in order to get "ansible_hostname" parameter, we need to "gather_facts: yes" in playbooks.
## - tasks/[offline|online].yml:
##       {{ ansible_env.PWD }}				## get by ansible(gather_facts: yes) from target hosts ENV 
## - tasks/main.yml
##       {{ type }}                                     ## we need to write parameter when run playbooks. eg: ansible-playbood -e type=offline (or online) xxx.yml
