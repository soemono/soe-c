#!/bin/bash
try(){
    expected="$1"
    input="$2"

    ./soe-c "$input" > tmp.s
    gcc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

try 0 0
try 42 42
try 255 255

try 21 "5+20-4"
try 10 "50 - 30 + 10 - 20"
echo OK
