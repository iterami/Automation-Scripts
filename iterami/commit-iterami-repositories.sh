#!/bin/sh

# Required arguments:
#   $1: Relative path to the directory in which the
#         iterami repositories are/will_be stored.
#   $2: Commit message.
#
# Example: sh commit-iterami-repositories.sh iterami_repositories/ 'This is a commit message!'

# Check if at least 2 arguments were passed.
if [ $# -lt 2 ]
then
    echo 'Missing argument: path commit-message'
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

# Commit cloned iterami repositories.
for repository in $repositories
do
    if [ -d $repository ]
    then
        echo 'adding/committing https://github.com/iterami/'$repository
        cd $repository
        git add -A
        git commit -m "$2"
        cd ..

    else
        echo 'https://github.com/iterami/'$repository' NOT YET CLONED'
    fi

    echo
done
