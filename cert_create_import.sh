#!/bin/sh

COMPANY_NAME=$1

if [ -z "$1" ]
  then
    echo "No 1st argument COMPANY_NAME (s*)"
    echo "Usage: $0 COMPANY_NAME"
    exit 1
fi

#create cert
openssl s_client -host mail.$COMPANY_NAME.com -port 465 -showcerts </dev/null 2>/dev/null | sed -n '/^-----BEGIN/,/-----END/p' > /tmp/mail.cert
#import cert
echo yes | keytool -keystore /usr/lib/jvm/jdk1.7.0_75/jre/lib/security/cacerts -storepass changeit -import -alias mail.$COMPANY_NAME.com -file /tmp/mail.cert

