#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo ::set-output name=time::$time

OUTPUT="$(oc login https://console.pathfinder.gov.bc.ca:8443 --token=$SERVICE_ACCOUNT_TOKEN)"
echo "${OUTPUT}"

OUTPUT="$(oc project ntu9uh-tools)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build hub-api-develop --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc tag hub-api:latest hub-api:DEVELOP-$BUILD_ID)"
echo "${OUTPUT}"

OUTPUT="$(oc tag hub-api:DEVELOP-$BUILD_ID hub-api:dev)"
echo "${OUTPUT}"

OUTPUT="$(oc tag hub-api:dev hub-api:test)"
echo "${OUTPUT}"