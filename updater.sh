#!/bin/bash

SEARCH=$1
NEW_VERSION=$2
CURRENT_VERSION=$(cat ./example.yaml  | grep -A3 ${SEARCH} | grep tag: | awk '{ print $(NF - 0); }')
echo "Replace $SEARCH version: $CURRENT_VERSION by $NEW_VERSION "
TEXT="container:
      image:
        tag:"
  
perl -i -0pe "s/${SEARCH}:
    ${TEXT} ${CURRENT_VERSION}/${SEARCH}:
    ${TEXT} ${NEW_VERSION}/" ./example.yaml