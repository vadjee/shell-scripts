#!/bin/sh


#Eclipse --> "Run As" > "Maven Build", click on the "JRE" tab, enter VM args e.g.
${env_var:MAVEN_OPTS}

#Eclipse --> "Run As" > "Maven Build", click on the "Environment" tab
MAVEN_OPTS=-Xmx1G -XX:MaxPermSize=512m

