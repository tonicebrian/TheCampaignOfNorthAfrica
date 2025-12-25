#!/bin/bash

cp $1 chapter.adoc 

# Add anchors for sections
perl -pi -e 's/\[(\d)\.(\d)\]/[#\1_\2]\n===/g' chapter.adoc
#perl -pi -e 's/\[\(\d\).\(\d\)\]/[#\1_\2]\r===/' chapter.adoc
# Add anchors for paragrah sections [3.23]
perl -pi -e 's/\[(\d)\.(\d\d)\]/[#\1_\2]*[\1.\2]*/g' chapter.adoc
#perl -pi -e 's/\[\(\d\).\(\d\d\)\]/[#\1_\2]*[\1.\2]*/' chapter.adoc
# Remove wong quotes
perl -pi -e 's/’’/"/g' chapter.adoc
perl -pi -e 's/‘‘/"/g' chapter.adoc
perl -pi -e "s/’/'/g" chapter.adoc
perl -CS -e 's/[\x{201C}\x{201D}\x{201E}]/"/g' chapter.adoc
perl -CS -e 's/â\x{80}[\x{9C}\x{9D}]/"/g' chapter.adoc
perl -pi -e 's/-\n//' chapter.adoc
