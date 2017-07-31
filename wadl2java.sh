#!/bin/sh
#https://wadl.java.net/wadl2java.html


COMPANY_NAME=$1
PROJECT_NAME=$2
CXF_HOME=~/work/opt/apache-cxf-2.7.17

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


rm -rf $CXF_HOME/wadls/generated/src/com

echo "copy wadl files"
cd $CXF_HOME/wadls/
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8181/cxf" > cxf-wadls.html
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/workflow?_wadl" > workflow-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/$PROJECT_NAME-auth?_wadl" > auth-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/audit-trail?_wadl" > audit-trail-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/$PROJECT_NAME-master-db?_wadl" > master-db-wadl.xml
curl "http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/prismAdmin?_wadl" > admin-wadl.xml

#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/tetra-alphatracker?_wadl
#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/assessment?_wadl
#http://$PROJECT_NAME-dev.$COMPANY_NAME.com:8080/pops/template?_wadl

echo "generate stubs"
cd $CXF_HOME/bin/
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.workflow.client.dto $CXF_HOME/wadls/workflow-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.prism.client.dto $CXF_HOME/wadls/auth-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.audit.trail.client.dto  $CXF_HOME/wadls/audit-trail-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.masterdb.client.dto $CXF_HOME/wadls/master-db-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.prism.client.dto $CXF_HOME/wadls/admin-wadl.xml

echo "finish OK"







