#!/bin/bash

WD=$(pwd)
cd $(dirname $(readlink -f $0))

if [ -r setenv.sh ]; then
    source setenv.sh
fi


if [ -z "$YOUSEE_HOME" ]; then
   echo "YOUSEE_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi


if [ -z "$TAVERNA_HOME" ]; then
   echo "TAVERNA_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi

if [ -z "$JAVA_HOME" ]; then
   echo "JAVA_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi

if [ -z "$YOUSEE_WORKFLOW_CONFIG" ]; then
   echo "YOUSEE_WORKFLOW_CONFIG is not set. Must be set before execution. Exiting"
   exit 1
fi


cd $WD
mkdir -p $YOUSEE_LOGS
mkdir -p $YOUSEE_LOCKS
echo $JAVA_HOME
$TAVERNA_HOME/executeworkflow.sh \
-inmemory \
-inputvalue mpgfile "$1"  \
"$YOUSEE_WORKFLOWS/vhsingest.t2flow"

exit 0

