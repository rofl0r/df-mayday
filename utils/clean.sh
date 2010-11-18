#/usr/bin/env bash
# parameter: directory with DF or DFG
# purpose: rip off everything unneeded for diffing.
if [[ -z "$1" ]]
then
	echo "supply a valid path as first parameter!"
else
	MDTMP=/tmp/mdtmp
	mkdir $MDTMP
	mv $1/data/init $MDTMP/init
	mv $1/raw/objects $MDTMP/objects
	rm -rf $1
	mkdir $1
	mkdir $1/data
	mv $MDTMP/init $1/data/
	mkdir $1/raw
	mv $MDTMP/objects $1/raw/
	rm -rf $MDTMP
fi
