#!/bin/sh

# Required args:
#   $1: Site name.
#
# Example usage: sh backup-make.sh SiteName

# Check if at least 1 arg was passed.
if [ $# -lt 1 ]
then
    echo 'Missing arg: site-name'
    exit 2
fi

# Create a new backup for each environment.
terminus site backup-make --env=dev --site=$1
terminus site backup-make --env=test --site=$1
terminus site backup-make --env=live --site=$1
