#!/bin/sh

# Required arguments:
#   $1: Relative path to the directory in which the
#         repository containing the commit you wish
#         to modify is located.
#   $2: The hash of the commit you wish to modify.
#   $3: The date you wish to use, in timestamp format.
#
# Example: sh commit-date-change.sh repositories/repository 92bbc4d9adb7aa284f5b7dd8b666be8d546c51fe 1408708800

# Check if at least 3 arguments were passed.
if [ $# -lt 3 ]
then
    echo 'Missing arguments.'
    exit 2
fi

# Navigate to the target directory name.
cd $1

# Modify the date of the specified commit.
git filter-branch -f --env-filter 'if [ $GIT_COMMIT = '$2' ]
    then
        export GIT_AUTHOR_DATE='$3'
        export GIT_COMMITTER_DATE='$3'
    fi'
