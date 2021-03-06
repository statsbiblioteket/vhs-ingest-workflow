#!/bin/bash

WD=$PWD
SCRIPT_PATH=$(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))


ENTITY=$1
XML=$2
CHANNELID=$3

NAME=`basename $0 .sh`

source $SCRIPT_PATH/env.sh

APPDIR="$VHSINGEST_COMPONENTS/${profile.validator}/"

CMD="$APPDIR/bin/validateXmlWithProfile.sh $ENTITY $WD/$XML $CONFIGFILE $CHANNELID"

OUTPUT="`execute "$PWD" "$CMD" "$NAME" "$ENTITY"`"
RETURNCODE=$?
echo "$OUTPUT"
exit "$RETURNCODE"
