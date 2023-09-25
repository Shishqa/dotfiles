#!/bin/sh

echo -e "\033[0;32m>>>>> Running Bootstrap <<<<<\033[0m"

ansible-playbook ../ansible/local.yml
