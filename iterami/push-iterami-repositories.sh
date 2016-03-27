#!/bin/sh

# Required arguments:
#   $1: Relative path to the directory in which the
#         iterami repositories are/will_be stored.
#
# Example: sh push-iterami-repositories.sh iterami_repositories/

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

# Execute iterami-repositories-push.sh, which has
#   the updated list of iterami repositories.
sh iterami-repositories-push.sh $1
