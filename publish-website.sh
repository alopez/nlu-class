#!/bin/bash
if [ "$1" == "" ]; then
    echo "Please supply a commit message";
    exit;
fi

# commit current content
git add .
git commit -m "$1"

# put on github for safekeeping
git push origin master

# generate new website
jekyll build --config _config4inf.yml

# move to publishing directory
pushd .
cd ../nlu

# publish new website
git add .
git commit -m "$1"
git cvsexportcommit -w ../web/teaching/courses/nlu -u -p -c HEAD^ HEAD

# return to working directory
popd
