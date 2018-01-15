Natural language understanding course website
=============================================

This directory contains a complete set of course material for the NLU course
at the University of Edinburgh. Most of the material was written by Mirella
Lapata and Frank Keller. I moved the course to this jekyll repository 
because I find it easier to write course pages in markdown.

Building the course page for Edinburgh Informatics
--------------------------------------------------

The School of Informatics manages updates to the website through cvs. I write
content in markdown for jekyll and manage everything with git. To make this
all work, I use the following process:

    # Set $CVSROOT
    export CVSROOT=:pserver:<username>@www.inf.ed.ac.uk:/cvsroot

    # Check out both cvs and git versions of the repo
    cvs login
    cvs checkout web/teaching/courses/nlu
    git cvsimport -d $CVSROOT -C nlu -r cvs -k web/teaching/courses/nlu

    # Configure the git clone of the cvs repo
    cd nlu
    git config cvsimport.module web/teaching/courses/nlu
    git config cvsimport.r cvs
    git config cvsimport.d $CVSROOT
    
    # Now, I can make changes as needed in this repository. If I want
    # to preview the results locally, I just run "jekyll build". When
    # I'm ready to commit the changes to the informatics server, I build
    # using a special config file that overwrites the git copy of the
    # the class directory, and then commit it from there using the git
    # bridge to cvs, like so:
    cd nlu-class
    jekyll build --config _config4inf.yml
    cd ../nlu
    git commit -am <commit message>
    git cvsexportcommit -w ../web/teaching/courses/nlu -u -p -c HEAD^ HEAD

Much of the process was adapted from [this stackoverflow question](http://stackoverflow.com/questions/584522/how-to-export-revision-history-from-mercurial-or-git-to-cvs/#586225).

