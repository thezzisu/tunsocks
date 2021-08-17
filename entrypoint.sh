#!/bin/bash

if [ $USER ] && [ $PASS ]; then
  echo "Welcome $USER"
else
  echo "Must provide USER and PASS env"
  exit 1
fi

if [ $URL ]; then
  echo "Connecting to $URL"
else
  echo "Must provide URL env"
  exit 1
fi

TUNSOCKS_ARGS=${TUNSOCKS_ARGS:="-D 0.0.0.0:1080 -H 0.0.0.0:8080"}
echo "tunsocks args: $TUNSOCKS_ARGS"

if [ $OC_ARGS ]; then
  echo "Running oc with args $OC_ARGS"
  ARGS=($OC_ARGS)
  echo $PASS | openconnect "${ARGS[@]}" --script-tun --script "tunsocks $TUNSOCKS_ARGS" --user $USER --passwd-on-stdin $URL
else
  echo $PASS | openconnect --script-tun --script "tunsocks $TUNSOCKS_ARGS" --user $USER --passwd-on-stdin $URL
fi