
# NullSec Ansible Configurations

Ansible playbooks and configurations for NullSec infrastructure and OSCP lab environments.

## Usage

# copy SSH key to the VM

`ssh-copy-id kali@10.0.0.60`

# Update inventory/hosts (remove the password line):
cat > inventory/hosts << 'EOF'
[kali]
kali-vm ansible_host=10.0.0.60 ansible_user=kali

[kali:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

# Run without password prompt
ansible-playbook playbooks/kali-provision.yml

### Provision Kali OSCP Box
```bash
ansible-playbook playbooks/kali-provision.yml
```

### Custom Variables
Edit `inventory/group_vars/all.yml` to customize IP, gateway, DNS, etc.

## Directory Structure
- `playbooks/` - Ansible playbooks
- `inventory/` - Host inventories and variables
- `roles/` - Reusable Ansible roles
