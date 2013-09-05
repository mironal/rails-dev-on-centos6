#!/bin/bash
source $HOME/.bash_profile

if ! which rails > /dev/null
then
    gem update --system
    gem install rails --no-ri --no-rdoc -V
    rbenv rehash
fi
