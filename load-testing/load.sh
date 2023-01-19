#!/bin/bash

set -e 

JMETER_PATH="/home/ksr/Documents/apache-jmeter-5.5/bin"
LOAD_PATH="/home/ksr/Documents/FYP/dev/project-task/load-testing"

cd ${JMETER_PATH}

./jmeter -n -t ${LOAD_PATH}/ThreadGroup.jmx -l ${LOAD_PATH}/testresults.jtl &

i=0
while [ $i -le 40 ]; do
    i=$(( $i + 1 ))
    kubectl top pod 
    sleep 1
done

wait
