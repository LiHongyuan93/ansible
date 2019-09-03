## Purpose

This role is aim to backup logs on offline Linux machine.


## Delivery

The backup function as below:
* Daily backup: 
	1. Find all folders in Linux machine which named 'log' or 'logs'; 
	2. Traversing the folders, find the log file which modified in 24 hours;
	3. Copy the log file to specific backup folder, and then delete original log file
	4. Generate xxx.zip file
* Weekly backup:
	1. Create weekly backup folder and copy daily xxx.zip to this folder 
* Monthly backup:
	1. Create monthly backup folder and copy weekly folder to this foler
	2. Generate to xxx.tar.gz

## Parameter

{{ ansible_env.PWD }}: Auto get from ansible 'setup' module (gather_facts: True);
{{ backup_cycle }}: Must fill in parameter, such as: 'daily', 'weekly', 'monthly' 


## Build

Create an ansible playbook, for example: touch backup_log_file.yml
---
- hosts: "{{ host_IP }}"
  become: yes
  roles:
    - backup_log


ansible-playbook -e backup_cycle=daily backup_log_file.yml


## Author
Created by Hongyuan Li <iris.li@gymboglobal.com> on 20181112.

