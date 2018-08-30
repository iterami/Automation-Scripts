#!/bin/sh

# Required arguments:
#   $1: Relative path to the directory in which the
#         iterami repositories are stored.
#
# Example: sh check-iterami-repositories.sh iterami_repositories/

# Check if at least 1 argument was passed.
if [ $# -lt 1 ]
then
    echo 'Missing argument: path'
    exit 2
fi

# Update this repository to fetch
#   latest list of iterami repositories.
echo 'pulling https://github.com/iterami/Scripts'
git pull
echo

# Get an array of all iterami repositories.
. ./iterami-repositories-list.sh

# Navigate to the target directory name
#   and create it if it doesn't exist.
mkdir -p $1
cd $1

# `git status` iterami repositories.
for repository in $repositories
do
    if [ -d $repository ]
    then
        echo 'checking https://github.com/iterami/'$repository
        cd $repository
        git status
        cd ..

    else
        echo 'https://github.com/iterami/'$repository' NOT YET CLONED'
    fi

    echo
done
