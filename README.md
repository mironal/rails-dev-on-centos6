# CentOS6 & rails環境を手に入れるｱﾚ

vagrant使ってCentOSの仮想マシンを立ち上げ、provisioningでrailsをインスコするところまでやる.

MySQLとかは入れてない.最小限の環境.

# 使い方

```sh
vagrant box add centos64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box

cd <git_clone_dir>
git clone https://github.com/mironal/rails-dev-on-centos6.git
cd rails-dev-on-centos6
vagrant up
vagrant ssh
```

