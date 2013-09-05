#!/bin/bash

# このスクリプトはrootユーザで実行される

# 指定したリポジトリがインストール済みか調べる
function exists_repo()
{
    url=$1
    if echo $1 | egrep -q "^https?://"
    then
        url=`basename $1`
    fi
    yum repolist all | grep -q `echo $url | sed -e "s/-.*$//"`
}

# install_repo [repo_url]
# yumにリポジトリを追加する.
# repo_urlにはリポジトリのURLを追加する.
# example) install_repo "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
function install_repo()
{
    cd /tmp
    wget -q $1
    repo_name=`basename $1`
    sudo rpm -Uvh $repo_name
    sudo yum-config-manager --disable `echo $repo_name | sed -e "s/-.*$//"` > /dev/null
}

# CentOSの動作を早くするためのｱﾚ
grep -q "options single-request-reopen" /etc/resolv.conf || \
    echo "options single-request-reopen" >> /etc/resolv.conf

# update
sudo yum -y -q update

# Disable firewall
chkconfig --list iptables | grep -e "on" && sudo chkconfig iptables off || echo "Firewall is disabled"

# Stop firewall
sudo service iptables status | grep -e "not running" || sudo service iptables stop

# yum-config-manager(yum-utils)をインストール
which yum-config-manager > /dev/null || sudo yum install -y yum-utils

# yumリポジトリの追加(なにか新しいものを入れたくなった時用)
EPEL_URL="http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
REMI_URL="http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"

# リポジトリが未追加だったら追加
exists_repo ${EPEL_URL} || install_repo ${EPEL_URL}
exists_repo ${REMI_URL} || install_repo ${REMI_URL}

# gitのインストール

which git > /dev/null || sudo yum install -y git

# rbenvのインストール
su vagrant -c "bash /vagrant/install_rbenv.sh"

# rubyのインストール
su vagrant -c "bash /vagrant/install_ruby.sh"

# railsのインスコ
su vagrant -c "bash /vagrant/install_rails.sh"

