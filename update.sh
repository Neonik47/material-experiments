#!/bin/bash

TIMESTAMP=$(date +"%Y\%m\%d %H:%M:%S")
COMMIT="search installed" #~($TIMESTAMP)"

echo -n "Commit > "
read commit

#~ git add .
#~ git rm -rf tmp/
#~ git commit -m "$COMMIT"
#~ git remote add origin git@github.com:1rpamm/equipment-system.git
#~ git push -u origin master

git add .
git rm -rf tmp/
git rm -rf log/
git commit -m "$commit"
git push --force --progress origin master
