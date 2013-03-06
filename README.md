cmake-modules
=============

My collection of cmake modules

Licesnce and copyright
======================

This collection is freely distributable without any warranty. 
You can use it for any purposes including proprietary projects. 

The author of this collection is Ruslan Mullakhmetov.

Modules Description
===================

## GitUtils

Provide a number of function to extract information from local git repository

### git_revision( DIR OUTVAR )

Gets revision number from specified local git repository (dir).

Git it decentralized SCM system, so there is no explicit revision number, instead we assume a number of commits as revision number (at least as a good aproximation). This method was suggested by OderWatless in this thread http://stackoverflow.com/questions/4120001/what-is-the-git-equivalent-for-revision-number

### git_last_commit_hash( DIR OUTVAR )

Gets last commit hash from specified local git repository (dir).
