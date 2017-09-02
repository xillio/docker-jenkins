#!/bin/bash
if [ -f /etc/realhostname ]; then
    export JENKINS_NAME=$(cat /etc/realhostname)
fi

ARGUMENTS="$(env | grep "^JENKINS_" | sed 's/JENKINS_//' | sed 's/\([A-Z]\+\)=/-\L\1 /')"

java -jar /opt/client.jar ${ARGUMENTS} $@