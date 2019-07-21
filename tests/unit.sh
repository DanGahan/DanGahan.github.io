#!/bin/bassh

RESULT=`curl -s -o /dev/null -w "%{http_code}"  http://localhost`

if [[ $RESULT =~ '200' ]]
  echo "Test Create: Success. Got: $result"
else
  echo "Test Create: Failure. Got: $result"
endif