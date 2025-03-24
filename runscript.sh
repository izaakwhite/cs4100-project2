#!/bin/bash

flex tokenizer.l

g++ lex.yy.c -o scanner

./scanner < plisTest.txt > output.txt

