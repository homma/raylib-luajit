#!/bin/sh

# @author Daisuke Homma

DATE=`date '+%Y/%m/%d %H:%M'`
MESSAGE="committed on ${DATE}."
SCRIPT_DIR=$(dirname $0)

if [ $# -eq 1 ]; then MESSAGE=$1; fi

git pull
git checkout main
git add ${SCRIPT_DIR}
git commit -a -m "${MESSAGE}"
git push origin main

