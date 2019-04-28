#!/bin/bash
REPO=/www/saolei.net/deploy/saolei.net-2008
DEPLOY_LOG=/www/saolei.net/deploy/deploy.log
GIT_LOG=/www/saolei.net/deploy/git.log
NOW=`date +%Y.%m.%d_%H:%m:%S`

cd $REPO

#OLD_COMMIT=`git log|head -n 1|sed 's/commit //'`
#git pull origin test >> $GIT_LOG 2>&1
#NEW_COMMIT=`git log|head -n 1|sed 's/commit //'`

OLD_COMMIT=b2e913
NEW_COMMIT=06d3de

if [ "$OLD_COMMIT" != "$NEW_COMMIT" ];then
    echo "-----[ $NOW ]-----" >> $DEPLOY_LOG
    echo "(${OLD_COMMIT:0:6}) -> (${NEW_COMMIT:0:6}) " | tee $DEPLOY_LOG
    git diff $OLD_COMMIT $NEW_COMMIT --name-only | tee $DEPLOY_LOG
fi