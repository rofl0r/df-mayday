#/usr/bin/env bash
# parameter: directory with DF or DFG
# purpose: rip off everything unneeded for diffing.

mkdir tmp
mv $1/data/init tmp/init
mv $1/raw/objects tmp/objects
rm -rf $1
mkdir $1
mkdir $1/data
mv tmp/init $1/data/
mkdir $1/raw
mv tmp/objects $1/raw/
rm -rf tmp
