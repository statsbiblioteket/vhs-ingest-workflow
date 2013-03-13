#!/bin/bash

cd $(dirname $(readlink -f $0))

if [ -r commonEnv.sh ]; then
    source commonEnv.sh
fi


if [ -z "$TAVERNA_HOME" ]; then
   echo "TAVERNA_HOME is not set. Must be set before execution. Exiting"
   exit 1
fi


VERSION=`head -1 $TAVERNA_HOME/release-notes.txt | sed 's/.$//' | cut -d' ' -f4`
LIB="$HOME/.taverna-$VERSION/lib/"
mkdir -p $LIB
#cp -u $VHSINGEST_DEPENDENCIES/*.jar $LIB
