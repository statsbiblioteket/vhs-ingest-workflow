#!/bin/bash

WD=$(pwd)
SCRIPT_PATH=$(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

ENTITY=$1
REMOTEURL=$2
CHECKSUM=$3
FFPROBEPROFILE_LOCATION=$4
FFPROBEERROR_LOCATION=$5
VHSMETADATA_LOCATION=$6
CROSSCHECKPROFILE_LOCATION=$7
USERNAME=$8
PASSWORD=$9



NAME=$(basename $0 .sh)

source $SCRIPT_PATH/env.sh

APPDIR="$VHSINGEST_COMPONENTS/${doms.ingester.vhsfile}"

cd $WD

##echo $VHSMETADATA_LOCATION
#CMD="echo {\"domsPid\": \"uuid:9dabe130-f1d9-11e1-aff1-0800200c9a66\"}"

CMD="$JAVA_HOME/bin/java -cp $APPDIR/bin/*:$APPDIR/external-products/*:$(dirname $CONFIGFILE) \
 dk.statsbiblioteket.doms.vhs.VHSIngesterCLI \
 -filename $ENTITY \
 -url $REMOTEURL \
 -ffprobe $FFPROBEPROFILE_LOCATION \
 -ffprobeErrorLog $FFPROBEERROR_LOCATION \
 -metadata $VHSMETADATA_LOCATION \
 -crosscheck $CROSSCHECKPROFILE_LOCATION \
 -config $CONFIGFILE \
 -user $USERNAME \
 -pass $PASSWORD"

#CMD="cat $VHSMETADATA_LOCATION"

OUTPUT="`execute "$PWD" "$CMD" "$NAME" "$ENTITY"`"
RETURNCODE=$?
echo "$OUTPUT"
exit "$RETURNCODE"

