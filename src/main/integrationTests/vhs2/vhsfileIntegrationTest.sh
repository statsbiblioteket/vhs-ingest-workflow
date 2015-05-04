#!/bin/bash

cd $(dirname $(readlink -f $0))

source vhsfileintegrationTestSetEnv.sh

echo "Running the vhs file integration test."
echo "This tests just ensures that at least one file makes it through the workflow"

source "/opt/ffmpeg26/enable"
which ffmpeg

cd ../..
./bin/ingestVHS2File.sh "-inputvalue" "vhsfile" "/home/tvtape/testfiles/Colossus_20140923_1039.ts" \
"-inputvalue" "jsonfile" "/home/tvtape/testfiles/Colossus_20140923_1039.ts.comments" \
"-inputvalue" "domsUser" "fedoraAdmin" \
"-inputvalue" "domsPass" "fedoraAdminPass" 
RETURNCODE=$?
if [ "$RETURNCODE" -ne "0" ]; then
    exit $RETURNCODE
fi

COUNT=`ls -1 logs/VHS_2_File_Ingest_Wo_output/ | grep -v \.error | wc -l`
echo $COUNT;
if [ "$COUNT" -gt "0" ]; then
    exit 0
else
    exit 1;
fi