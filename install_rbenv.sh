#!/bin/bash

if [ ! -d $HOME/.rbenv ];then
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bash_profile
    echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
    git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

