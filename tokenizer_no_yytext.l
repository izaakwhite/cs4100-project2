/*
 * Authours: Izaak White & Joshua Moner
 * Run commands: 
 * flex tokenizer.l 
 * g++ lex.yy.c -o <name> -ll
 * tokenizer <inputfile> 
 */
%{
#include <stdio.h>
#include <stdlib.h>
/* Declare yyin if reading from file */
extern FILE *yyin;
%}



/* Lexical rules */
%%
"buildnode"             { printf("<buildnode>"); }
"name"                  { printf("<name>"); }
"weight"                { printf("<weight>"); }
"for"                   { printf("<for>"); }
"in"                    { printf("<in>"); }
"isachildof"            { printf("<isachildof>");}

\"([^\\\n]|(\\.))*?\"     { printf("<string>"); }

[0-9]+                  { printf("<int>"); }

[A-Za-z0-9][A-Za-z0-9_]* { printf("<var>"); }

"="                     { printf(" = "); }
"\+"                    { printf(" + "); }

"{"                     { printf("{"); }
"}"                     { printf("}"); }
"\["                    { printf("["); }
"\]"                    { printf("]"); }
";"                     { printf(";\n"); }
":"                     { printf(":"); }
","                     { printf(","); }


[ \t\n\r]+              { /* Do nothing */ }


.                       { printf("UNKNOWN: \n"); }
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
