#!/usr/bin/env bash

GREEN=0
RED=2

if [ "$#" -ne 2 ]; then
	exit 2
fi

binary=$1
testdir=$2

$binary -no_init -exit run.tcl > log.txt 2>&1
 
grep -q "missing track structure" log.txt

status=$?

mkdir -p ../../results/test_no_tracks
cp log.txt ../../results/test_no_tracks/fastroute.log

if [ $status -eq 0 ]; then
    exit $GREEN
else
    exit $RED
fi
