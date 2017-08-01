#!/bin/sh
#https://wadl.java.net/wadl2java.html

COMPANY_NAME=$1
PROJECT_NAME=$2
CXF_HOME=~/work/opt/apache-cxf-2.7.17

echo "Check args ..."
#bash <(curl -s https://raw.githubusercontent.com/vadjee/shell-scripts/master/check_args_company_project.sh)
#curl -s https://raw.githubusercontent.com/vadjee/shell-scripts/master/check_args_company_project.sh | bash /dev/stdin arg1 arg2
#curl -s https://raw.githubusercontent.com/vadjee/shell-scripts/master/check_args_company_project.sh 
#check_args_company_project a s
#echo "Return value is $?"

if [ -z "$1" ]
  then
    echo "No 1st argument COMPANY_NAME"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "No 2nd argument PROJECT_NAME"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi


echo "Copy wadl files ..."
cd $CXF_HOME/wadls/
cp workflow-wadl.xml old-workflow-wadl.xml
cp auth-wadl.xml old-auth-wadl.xml
cp audit-trail-wadl.xml old-audit-trail-wadl.xml
cp master-db-wadl.xml old-master-db-wadl.xml
cp admin-wadl.xml old-admin-wadl.xml

# Update wadls
echo "Update wadl files ..."
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8181/cxf" > cxf-wadls.html
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/workflow?_wadl" > workflow-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/$PROJECT_NAME-auth?_wadl" > auth-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/audit-trail?_wadl" > audit-trail-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/$PROJECT_NAME-master-db?_wadl" > master-db-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/prismAdmin?_wadl" > admin-wadl.xml

#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/tetra-alphatracker?_wadl
#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/assessment?_wadl
#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/template?_wadl

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

echo "Check diff wadl files ..."
check_diff_files workflow-wadl.xml old-workflow-wadl.xml
#echo "Return value is $?"
check_diff_files auth-wadl.xml old-auth-wadl.xml
#echo "Return value is $?"
check_diff_files audit-trail-wadl.xml old-audit-trail-wadl.xml
#echo "Return value is $?"
check_diff_files master-db-wadl.xml old-master-db-wadl.xml
#echo "Return value is $?"
check_diff_files admin-wadl.xml old-admin-wadl.xml
#echo "Return value is $?"




