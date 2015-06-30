#!/bin/bash -e

BUILD_DIR="./build"
ORIGIN_OUTPUT_DIR=".."  # relative from BUILD_DIR

echo "create build dir..."
mkdir -p $BUILD_DIR
cd $BUILD_DIR

echo "clean..."
rm -rf *

echo "copy ipa file..."
cp $ORIGIN_OUTPUT_DIR/*.ipa ./

echo "copy plist file..."
cp $ORIGIN_OUTPUT_DIR/*.dSYM.zip ./
unzip *.dSYM.zip 
cp *.dSYM/Contents/*.plist .
rm -rf *.dSYM
rm *.dSYM.zip 

echo "copy history.html file..."
# TODO
