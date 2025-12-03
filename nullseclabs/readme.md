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
