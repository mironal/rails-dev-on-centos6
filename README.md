# CentOS6 & rails環境を手に入れるｱﾚ

vagrant使ってCentOSの仮想マシンを立ち上げ、provisioningでrailsをインスコするところまでやる

# 使い方

```sh
vagrant box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box

cd <git_clone_dir>
git clone <repo_url>
cd <clone_dir>
vagrant up
vagrant ssh
```
