#!/bin/bash
if [ "$1" == "" ]; then
    echo "Please supply a commit message";
    exit;
fi

# commit current content
git add .
git commit -m "$1"

# generate new website
jekyll build --config _config4inf.yaml

# move to publishing directory
pushd .
cd ../nlu

# publish new website
git commit -m "$1"
git cvsexportcommit -w ../web/teaching/courses/nlu -u -p -c HEAD^ HEAD

# return to working directory
popd
