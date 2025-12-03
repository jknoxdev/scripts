readme.md
----
on mac, the regular UTM will also need vagrant installed


* if needed *
```
brew install --cask utm
```

```
brew install hashicorp/tap/hashicorp-vagrant
vagrant plugin install vagrant-utm
```

then add in the ruby code for the vagrant file

and cp the following json to the vm directory: 
```
{
  "provider": "utm"
}
```

from this guid: 
https://github.com/icyb3r-code/kali-build

within the kali linux machine:
```bash
ansible-galaxy collection install community.general
ansible-galaxy install -r requirements.yml --roles-path ./roles --force
sudo whoami
ansible-playbook -i inventory.yml main.yml
```
