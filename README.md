# Ansible Drone Plugin

an ansible container to be used as drone.io cicd pipeline plugin for testing ansible-playbooks.

Example .drone.yml:

    pipeline:
      test-ansible-playbook:
        image: jpduyx/ansible:latest
        commands:
        - cd tst
        - chmod -R 0600 keys/id_rsa*
        - pwd
        - ansible-playbook --private-key="keys/id_rsa"    myplaybook.yml 

