#!/bin/bash -e

echo "create build dir..."
mkdir -p ./build
cd ./build

echo "clean..."
rm -rf *

echo "copy ipa file..."
cp ../*.ipa ./

echo "copy plist file..."
cp ../*.dSYM.zip ./
unzip *.dSYM.zip 
cp *.dSYM/Contents/*.plist .
rm -rf *.dSYM
rm *.dSYM.zip 

echo "copy history.html file..."
# TODO
