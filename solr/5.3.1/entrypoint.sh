#!/bin/bash
set -e

# if command starts with an option, prepend solr
if [ "${1:0:1}" = '-' ]; then
  set -- solr "$@"
fi

if [ "$1" = 'solr' ]; then
  $SOLR_INSTALL_DIR/server/scripts/cloud-scripts/zkcli.sh -zkhost ${ZK_STRING} \
    -cmd putfile /solr.xml $SOLR_INSTALL_DIR/server/solr/solr.xml
  solr -f -c -z ${ZK_STRING} -s $SOLR_HOME
fi

exec "$@"
