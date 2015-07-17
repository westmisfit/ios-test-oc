#!/bin/bash

set -ex
which pip > /dev/null || curl -O https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py
