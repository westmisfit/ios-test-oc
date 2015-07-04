#!/bin/bash

function install_pip
{
    # echo easy_install pip
    curl -O https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
}

which pip && install_pip
