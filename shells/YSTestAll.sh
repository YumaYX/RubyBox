#!/bin/zsh

# YSDecripytTest.rb
PRIVATEKEY='private.key'
PUBLICKEY='public.key'
openssl genrsa -out ${PRIVATEKEY} 4096 > /dev/null 2>&1
openssl rsa -in ${PRIVATEKEY} -pubout -out ${PUBLICKEY}  > /dev/null 2>&1
echo "abc" | openssl rsautl -encrypt -pubin -inkey ${PUBLICKEY} -out encrypted > /dev/null 2>&1


TESTFILES="./test/*.rb"
for f in ${TESTFILES}
do
	echo ${f#./}
	ruby ${f} | grep skips
	echo
done