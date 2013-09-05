#!/bin/bash

source $HOME/.bash_profile

RUBY_VERSION="2.0.0-p247"

if ! rbenv version | grep -q "${RUBY_VERSION}"
then
    rbenv install -v ${RUBY_VERSION}
    rbenv rehash
    rbenv global ${RUBY_VERSION}
fi

