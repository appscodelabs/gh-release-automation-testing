#!/bin/bash

# GITHUB_REF=refs/heads/master
# GITHUB_REF=refs/tags/v0.1.5

GITHUB_REPOSITORY=tamalsaha/gh-release-automation-testing
GITHUB_REPOSITORY_OWNER=tamalsaha
reponame=${GITHUB_REPOSITORY#$GITHUB_REPOSITORY_OWNER"/"}
echo $reponame
