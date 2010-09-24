#!/usr/bin/env bash
# argument: file name
# special chars in the file will be patched
MYFILE=$1
TMPFILE=/tmp/chfx$RANDOM.tmp
./charfix.pl $MYFILE > $TMPFILE
cp $TMPFILE $MYFILE
rm $TMPFILE
