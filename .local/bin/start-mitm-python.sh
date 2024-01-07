#!/bin/bash

# The following works well for python application

export REQUESTS_CA_BUNDLE=~/.mitmproxy/mitmproxy-ca-cert.pem
#
# this tells python requests to be routed throught proxy
export https_proxy=http://localhost:9090

mitmproxy -p 9090
