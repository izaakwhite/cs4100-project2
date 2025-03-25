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

# diff output.txt output2.txt > diff.txt

rm -f lex.yy.c

rm -f scanner