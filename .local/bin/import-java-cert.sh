#!/bin/sh

openssl x509 -in ~/Downloads/mitmproxy-ca-cert.pem -inform pem -out ca.der -outform der

sudo keytool -importcert -alias mitmproxy -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit -file ca.der
