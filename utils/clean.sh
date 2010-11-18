#!/usr/bin/env bash
# parameter: directory with DF or DFG
# purpose: rip off everything unneeded for diffing.
DFDIR=$1
ROOTDIR="/"
DOTDIR="."
if [[ -z "$DFDIR" ]]
then
	echo "supply a valid path as first parameter!"
elif [[ "$DFDIR" == "$ROOTDIR" ]]
then
	echo "omg. you REALLY shouldnt apply this on your root dir."
elif [[ "$DFDIR" == "$DOTDIR" ]]
then
	echo "you have to cd out of the distrib dir. just cd .. and call again"
elif [[ ! -e "$DFDIR/data/init" ]]
then
	echo "your target doesnt look like a DF dir. exitting."
else
	MDTMP=/tmp/mdtmp
	mkdir $MDTMP
	mv $DFDIR/data/init $MDTMP/init
	mv $DFDIR/raw/objects $MDTMP/objects
	rm -rf $DFDIR
	mkdir $DFDIR
	mkdir $DFDIR/data
	mv $MDTMP/init $DFDIR/data/
	mkdir $DFDIR/raw
	mv $MDTMP/objects $DFDIR/raw/
	rm -rf $MDTMP
fi
