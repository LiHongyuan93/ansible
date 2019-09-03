## Purpose

This role is aim to sync time to remote ntp server

## Delivery

This sync time function as below:
1. Check ntp status, install ntp server if not exist
2. Modify ntp configure file to sync time on special remote ntp server
3. Let system time sync to hardware time
4. Modify time zone, system time sync to remote ntp server

## Parameter

Do not have

## Build
Create an ansible playbook, for example: deploy_ntp_sync_time.yml
- hosts: "{{ host_IP }}"
  become: yes
  roles:
    - ntp

ansible-playbook deploy_ntp_sync_time.yml

## Author
Created by Hongyuan Li iris.li@gymboglobal.com on 20181123.

