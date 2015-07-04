#!/bin/bash

find $INFER_HOME -name infer

if [[ -f $INFER_HOME/infer/bin/infer ]]; then
    git clone --depth=50 https://github.com/facebook/infer.git $INFER_HOME
fi