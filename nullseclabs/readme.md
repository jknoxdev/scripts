readme.md
----

# hypervisor setup
on mac, the regular UTM will also need vagrant installed


* if needed *
```
brew install --cask utm
```

```
brew install hashicorp/tap/hashicorp-vagrant
vagrant plugin install vagrant-utm
```

then add in the ruby code for the vagrant file at the vagrant directory

cp the following json to the vm directory: 
```
{
  "provider": "utm"
}
```

# bringing up the vm

First, ensure Packer is installed on your macOS system (e.g., via Homebrew: brew install packer). 

`brew install packer`

setup the hcl [./kali-utm-build.pkr.hcl](./kali-utm-build.pkr.hcl)

touch http/preseed.cfg

add the checksum to the hcl ^

install packer plugin: 
`packer plugins install  -force  github.com/naveenrajm7/utm`



from this guide: 
https://github.com/icyb3r-code/kali-build

within the kali linux machine:
install Ansible using pip pip3 install ansible.
Clone this repo to your kali linux git clone.
change you current working directory inside kali-build.
```bash
ansible-galaxy collection install community.general
ansible-galaxy install -r requirements.yml --roles-path ./roles --force
sudo whoami
ansible-playbook -i inventory.yml main.yml
```
