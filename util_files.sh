#!/bin/sh

# check diff of 2 files
check_diff_files () {
	# echo "check diff $1 $2"
	diff -w $1 $2 >/dev/null 2>&1
	# Capture value returnd by last command
	ret_val=$?
	if [ $ret_val -eq 0 ]
	then
	    echo "Files are the same $1, $2"
	else
	    echo "Files are different $1, $2 -->"
	    colordiff -w $1 $2
	fi
	return $ret_val
}

#copy folder
yes | cp -rf /xxx/xxx/* /yyy/yyy/

#remove folder
rm -rf /yyy/yyy

#add exutable
chmod +x fuse_start_debug.sh

#chown recursive
chown ${USER}:${USER} ${HOME}/work/opt/tomcat -R
