#!/usr/bin/env bash
LOG=mayday-patch.log
patch -p1 --verbose < mayday.diff > $LOG
ERRS=`cat $LOG | grep "FAILED"`
if [[ ! -z "$ERRS" ]]
then
	echo "there were some errors, manual intervention is required\n"
	echo $ERRS
	echo "for more details see $LOG"
else
	find ./raw/objects -name 'language*' -exec ./apply-charpatch.sh {} \;
	echo "success!"
fi
