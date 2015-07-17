#!/bin/bash

set -ex
openssl aes-256-cbc -k "$super_secret_password" -in README.md.enc -out test_README.md -d
echo super_secret_password=$super_secret_password
cat README.md
cat test_README.md
