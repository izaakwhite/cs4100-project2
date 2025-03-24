/*
 * Izaak White & Joshua Moner
 */
%{
#include <stdio.h>
#include <stdlib.h>
/* Declare yyin if reading from file */
extern FILE *yyin;
%}

/* Lexical rules */
%%
"buildnode"             { printf("KEYWORD: %s\n", yytext); }
"for"                   { printf("KEYWORD: %s\n", yytext); }
"in"                    { printf("KEYWORD: %s\n", yytext); }

\"([^\\"]|(\\.))*\"     { printf("STRING_LITERAL: %s\n", yytext); }

[0-9]+                  { printf("INTEGER_LITERAL: %s\n", yytext); }

[A-Za-z0-9][A-Za-z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }

"="                     { printf("OPERATOR: %s\n", yytext); }
"\+"                    { printf("OPERATOR: %s\n", yytext); }

"{"                     { printf("SYMBOL: %s\n", yytext); }
"}"                     { printf("SYMBOL: %s\n", yytext); }
"\["                    { printf("SYMBOL: %s\n", yytext); }
"\]"                    { printf("SYMBOL: %s\n", yytext); }
";"                     { printf("SYMBOL: %s\n", yytext); }
":"                     { printf("SYMBOL: %s\n", yytext); }
","                     { printf("SYMBOL: %s\n", yytext); }


[ \t\n\r]+              { /* Do nothing */ }


.                       { printf("UNKNOWN: %s\n", yytext); }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            exit(EXIT_FAILURE);
        }
        yyin = file;
    }
    yylex();
    return 0;
}
