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

OUTPUT="$(oc start-build frontend-sonar --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build frontend-snyk --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build frontend-yarn-builder --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build frontend-nginx-runtime --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build news-dashboard --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc start-build news-dashboard-static --wait)"
echo "${OUTPUT}"

OUTPUT="$(oc tag news-dashboard-static:latest news-dashboard-static:DEVELOP-$BUILD_ID)"
echo "${OUTPUT}"

OUTPUT="$(oc tag news-dashboard-static:DEVELOP-$BUILD_ID news-dashboard-static:dev)"
echo "${OUTPUT}"

OUTPUT="$(oc tag news-dashboard-static:dev news-dashboard-static:test)"
echo "${OUTPUT}"

