#!/bin/zsh

TESTFILES="./test/*.rb"
for f in ${TESTFILES}
do
	echo ${f#./}
	ruby ${f} | grep skips
	echo
done