#!/bin/bash
# Izaak White and Joshua Moner

make

./scanner < plisTest.txt > tokens_with_values.txt

make clean

flex tokenizer_no_yytext.l

g++ lex.yy.c -o scanner -ll

./scanner < plisTest.txt > tokens.txt

# diff -y tokens.txt tokens_with_values.txt > diff.txt

make clean

echo ""
echo "*--------------------------------------------------------------------------------------------*"
echo "|RAW TOKENS:                                                 VALUES & TOKENS:                |"
echo "*--------------------------------------------------------------------------------------------*"
echo ""
diff -y tokens.txt tokens_with_values.txt