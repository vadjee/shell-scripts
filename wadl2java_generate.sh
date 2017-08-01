#!/bin/sh
#https://wadl.java.net/wadl2java.html

COMPANY_NAME=$1
PROJECT_NAME=$2
CXF_HOME=~/work/opt/apache-cxf-2.7.17

echo "Check args ..."
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

echo "Generate stubs ..."
cd $CXF_HOME/bin/
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.workflow.client.dto $CXF_HOME/wadls/workflow-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.prism.client.dto $CXF_HOME/wadls/auth-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.audit.trail.client.dto  $CXF_HOME/wadls/audit-trail-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.masterdb.client.dto $CXF_HOME/wadls/master-db-wadl.xml
./wadl2java -d $CXF_HOME/wadls/generated/src -p com.$COMPANY_NAME.$PROJECT_NAME.prism.client.dto $CXF_HOME/wadls/admin-wadl.xml

echo "Copy stubs stubs ..."
yes | cp -rf $CXF_HOME/wadls/generated/src/com/* ~/work/workspaces/$PROJECT_NAME-operational-workspace/$PROJECT_NAME-operational-web/rest-api/src/main/java/com/

echo "Finish generate stubs OK"







