#!/usr/bin/env bash
# use this on a backup copy of actual DF and a MAYDAYed Df
# contents will be trashed !
THIS=`dirname $0`
ORG=$1
MAYDAY=$2
$THIS/clean.sh $ORG
$THIS/clean.sh $MAYDAY
diff -r -C1 --exclude=language* -w -B -E  $ORG $MAYDAY > mayday.diff
