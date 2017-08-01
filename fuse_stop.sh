#!/bin/sh
COMPANY_NAME=$1
PROJECT_NAME=$2

if [ -z "$1" ]
  then
    echo "No 1st argument COMPANY_NAME (s*)"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi


if [ -z "$2" ]
  then
    echo "No 2nd argument PROJECT_NAME (t*)"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi


if [ -z "$FUSE_HOME" ]; then
  export FUSE_HOME=$HOME/work/opt/fuse-6.1.0.redhat-379;
fi

echo "FUSE_HOME=$FUSE_HOME"
echo "HOME=$HOME"

sudo rm -rf $FUSE_HOME/data
sudo rm -rf /home/$USER/work/opt/fuse-6.1.0.redhat-379/data

[ -f $FUSE_HOME/lock ] && sudo rm $FUSE_HOME/lock
sudo rm -rf $HOME/work/opt/$PROJECT_NAME/temp/
sudo rm -rf /tmp/fakerepo
sudo rm -rf /tmp/hsperfdata_root
sudo rm -rf /tmp/hsperfdata_$USER
#sudo rm -rf /opt/$PROJECT_NAME/fs-repo

sudo rm -rf $HOME/.karaf
sudo rm -rf $HOME/.m2/repository/com/$COMPANY_NAME
sudo rm -rf $FUSE_HOME/tmp_m2_repo/com/$COMPANY_NAME
#sudo rm -rf /root/.m2/repository/com/$COMPANY_NAME

if [ -d $FUSE_HOME/data ] ; then
  echo "Clean problem"
else #if needed #also: elif [new condition] 
  echo "JBoss Fuse & Maven repo is cleaned"
fi

