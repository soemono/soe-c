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
# 与えられた数値をそのまま返す
try 0 0
try 42 42
try 255 255

# --加減算--
try 21 "5+20-4"
try 10 "50 - 30 + 10 - 20"

# --乗除算、括弧--
try 31 "1+10*3"
try 100 "10*(15-5)" 
try 15 "(10+20)/2"

# --単項+/-演算子--
try 20 "+10+10"
try 10 "-10+20"

# --比較演算子--
# >
try 1 "1 > 0"
try 0 "1 > 1"
try 0 "0 > 1"

# <
try 1 "0 < 1"
try 0 "1 < 1"
try 0 "1 < 0"

# >=
try 1 "1 >= 0"
try 1 "1 >= 1"
try 0 "0 >= 1"

# <=
try 1 "0 <= 1"
try 1 "1 <= 1"
try 0 "1 <= 0"

# ==
try 1 "1 == 1"
try 0 "1 == 0"

# !=
try 1 "1 != 0"
try 0 "1 != 1"


echo OK
