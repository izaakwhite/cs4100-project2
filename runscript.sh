#!/bin/bash
# Izaak White and Joshua Moner

flex tokenizer.l

g++ lex.yy.c -o scanner -ll

./scanner < plisTest.txt > tokens_with_values.txt

./scanner < plisTest.txt

rm -f lex.yy.c

rm -f scanner

flex tokenizer_no_yytext.l

g++ lex.yy.c -o scanner -ll

./scanner < plisTest.txt > tokens.txt

# diff -y tokens.txt tokens_with_values.txt > diff.txt

rm -f lex.yy.c

rm -f scanner
echo ""
echo "*--------------------------------------------------------------------------------------------*"
echo "|RAW TOKENS:                                                 VALUES & TOKENS:                |"
echo "*--------------------------------------------------------------------------------------------*"
echo ""
diff -y tokens.txt tokens_with_values.txt