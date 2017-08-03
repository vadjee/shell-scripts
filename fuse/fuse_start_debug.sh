#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_75
export JAVA_OPTS="$JAVA_OPTS -Xloggc:/home/vadim/work/opt/tetra/temp/gc.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails"
export JAVA_OPTS="$JAVA_OPTS -Xmx1G -XX:MaxPermSize=600m"

if [ -z "$FUSE_HOME" ]; then
  export FUSE_HOME=$HOME/work/opt/fuse-6.1.0.redhat-379;
fi

echo "FUSE_HOME=$FUSE_HOME"
echo "HOME=$HOME"

echo "Start Fuse ..."
$FUSE_HOME/bin/fuse debug
echo "End"
