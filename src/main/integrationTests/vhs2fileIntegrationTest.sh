#!/bin/bash

cd $(dirname $(readlink -f $0))

##source vhsfileintegrationTestSetEnv.sh

export JAVA_HOME="/usr/java/java-1.6.0-sun-1.6.0.33.x86_64"
#export URL_PREFIX="http://canopus/cfutvdownload/"


echo "Running the vhs2 file integration test."
echo "This tests just ensures that at least one ts file makes it through the workflow"

source "/opt/ffmpeg26/enable"

cd ..

./bin/startVHS2Workflow.sh --vhsfile /scratch-tvtape-test/Colossus_VHS-files-workflow-test.ts --jsonfile /scratch-tvtape-test/Colossus_VHS-files-workflow-test.ts.comments

RETURNCODE=$?
if [ "$RETURNCODE" -ne "0" ]; then
    exit $RETURNCODE
fi
