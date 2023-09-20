#! /bin/bash

#converts a given ip address in binary into decimal

echo "Enter an ip address in binary (32 digit): "
read binaryip

first8="${binaryip:0:8}"
second8="${binaryip:8:8}"
third8="${binaryip:16:8}"
fourth8="${binaryip:24:8}"

firstbin=$((2#"${first8}"))
secondbin=$((2#"${second8}"))
thirdbin=$((2#"${third8}"))
fourthbin=$((2#"${fourth8}"))

echo "${firstbin}.${secondbin}.${thirdbin}.${fourthbin}"
