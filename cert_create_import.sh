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



######################################################
Adding of trusted ssl certificate -	This steps need to do if endpoint url is https
View cert list: 
	keytool -list -keystore /opt/totaltel/inmediator/ssl/trustStore.jks -storepass changeit
	/usr/java/jdk1.6.0_18/bin/keytool -list -keystore trustStore.jks -storepass changeit	
	
Get certificate from endpoint

openssl s_client -showcerts -connect ENDPOINT_SERVER:ENDPOINT_PORT </dev/null

Put output between

-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----

including tags to certificate file:

cat > ADAPTER_NAME.cer

Import certificate to keystore

keytool -import -noprompt -trustcacerts -alias ALIAS_NAME -file ADAPTER_NAME.cer -keystore PATH_TO_KEYSTORE -storepass PASSWORD
cd /opt/totaltel/inmediator/ssl/
/usr/java/jdk1.6.0_18/bin/keytool -import -noprompt -trustcacerts -alias "RapidSSL CA" -file infobiphlr.cer -keystore trustStore.jks -storepass changeit


ADAPTER_NAME 	Specified at first guide step "Specify adapter name"
ALIAS_NAME 	CN of certificate Issuer
ENDPOINT_SERVER 	Server of endpoint url. Without https://
ENDPOINT_PORT 	If endpoin url doesn"t have port then use 443 port
INMEDIATOR_LOCATION 	/opt/totaltel/inmediator/inm_primary
PATH_TO_KEYSTORE 	Specified at app.conf in value of app.trust_store key
