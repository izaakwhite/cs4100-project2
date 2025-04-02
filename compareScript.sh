#!/bin/bash
# Izaak White and Joshua Moner

flex tokenizer.l

g++ lex.yy.c -o scanner -ll

./scanner < plisTest.txt > tokens_with_values.txt

make clean

make

./scanner < plisTest.txt > tokens.txt

# diff -y tokens.txt tokens_with_values.txt > diff.txt

make clean

echo ""
echo "*--------------------------------------------------------------------------------------------*"
echo "|RAW TOKENS:                                                 VALUES & TOKENS:                |"
echo "*--------------------------------------------------------------------------------------------*"
echo ""
diff -y tokens.txt tokens_with_values.txt