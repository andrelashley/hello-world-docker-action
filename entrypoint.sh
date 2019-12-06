#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo ::set-output name=time::$time

OUTPUT="$(oc version)"
echo "oc version"