#!/bin/bash

if [[ which pip ]]; then
    # echo easy_install pip
    curl -O https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
fi
