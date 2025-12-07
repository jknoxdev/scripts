
# NullSec Ansible Configurations

Ansible playbooks and configurations for NullSec infrastructure and OSCP lab environments.

## Usage

build vm and assign a same-network ip address as 10.0.0.33 

create ansible-vault inside of ~/vaults/nullsec-ansible.yaml  on host

uses key at ~/keys/nullsec-ansible-vault.pw 

make sure machine is pingable, and has ssh-copy-id 

`ssh-copy-id kali@10.0.0.33`

run the playbook once the ssh-key has been copied in!

`ansible-playbook playbooks/kali-provision.yaml`

log in to machine and install caffeine
`sudo apt install caffeine`

run caffeine-indicator and make sure machine is caffinated:
`caffeine-indicator`

> click the coffee logo -> activate

grab a coffee while the provisioner runs, estimated time around 30-40 minutes on mac m1-mini
