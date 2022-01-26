#!/bin/bash

FHASH=$(md5sum "$1")
while true; do
  NHASH=$(md5sum "$1")
  if [ "$NHASH" != "$FHASH" ]; then
    ./mdp -file "$1"
    FHASH=$NHASH
    $2
  fi
  sleep 5
done