#!/bin/bash
# Izaak White and Joshua Moner

flex tokenizer.l

g++ lex.yy.c -o scanner -ll

./scanner < plisTest.txt > output.txt

./scanner < plisTest.txt

rm -f lex.yy.c

rm -f scanner