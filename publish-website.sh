#!/bin/bash
if [ "$1" == "" ]; then
    echo "Please supply a commit message";
    exit;
fi

# commit current directory
git add .
git commit -m "$1"
pushd .
cd ../nlu
ls
popd
