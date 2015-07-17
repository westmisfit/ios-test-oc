#!/bin/bash

set -ex

if ! which pip > /dev/null ; then
    curl -O https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
fi
