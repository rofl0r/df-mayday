#!/usr/bin/env bash
echo "*** mayday-patchset for POSIX by rofl0r ***"
echo -ne "\n"
echo "trying to apply mayday.diff...."
LOG=mayday-patch.log
patch -p1 --verbose < mayday.diff > $LOG
ERRS=`cat $LOG | grep "FAILED"`
if [[ ! -z "$ERRS" ]]
then
	echo -ne "there were some errors, manual intervention is required\n"
	echo $ERRS
	echo "for more details see $LOG"
else
	echo "success! now fixing the characters in language files."
	echo "hold your breath this may take a minute or two...."
	find ./raw/objects -name 'language*' -exec ./apply-charpatch.sh {} \;
	echo "done!"
fi
