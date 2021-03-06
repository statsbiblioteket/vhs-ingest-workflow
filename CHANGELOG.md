Version 2.6
===========

* clip workflow updated to use different config for ts files in ffprobe validator component
* tests updated with different log and cache files for ffprobe validation in the different workflows; test designed to fail ffprobe validation now included

Version 2.5
===========
* Update to correct JSON API
* Updates tests to new digitized files

Version 2.4
===========
* changed clip workflow input file name back to mpgfile for compatibiblity with DomsGui component (though it can now be either an mpg- or a ts-file)
* changed file workflow to give better crosscheck log output

Version 2.3
===========
* file workflow now updated to _not_ copy file

Version 2.2
===========
* file workflow now updated with crosscheck characterisation and validation
* JSON Comments "channelLabel" -> "channel" update to workflow

Version 2.1
===========
* clip workflow now updated with crosscheck characterisation and validation

Version 2.0
===========
* new version 2.0 now depends on vhsdomsingester version 2.0 and youseedomsingester version 2.0
Notice new config file format for doms ingester

Version 1.1
===========
* Changelog now included in the release package.
* Fixed a bug in the order of the elements in the VHS metadata.
* Radically simplified the script and envelope structure. The file setup.infrastructure.sh is now the only configuration file inside the deploy
tree which may require customisation. The three "endpoints" - ingestVHSClip.sh, ingestVHSFile.sh and startVHS2Workflow.sh have not changed their
location or usage.

Version 1.0
===========

* New workflow for ingest of files from the VHS2 digitisation workflow
* Startscript for the new workflow `bin/startVHS2Workflow.sh --vhsfile=<vhsfile> --jsonfile=<jsonfile>`
* A new configuration file is expected in the root of the configuration directory (e.g. `$HOME/services/conf/vhs-ingest`) . The file is
called `startVHS2Workflow.conf` but is otherwise identical to (e.g. a symlink to) the existing `remoteDigividIngest.conf`
 
