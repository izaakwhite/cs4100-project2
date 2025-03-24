/*
 * Izaak White & Joshua Moner
 */
%{
#include <stdio.h>

/* Tokens */
#define VAR     200
#define FOR     210
#define NAME    400
#define WEIGHT  401
#define ISCHILD 402
%}

text [A-Za-z_][A-Za-z0-9_]* 
whitespace [ \t\n]+
number [0-9]+
quoted      \"([^\\\n]|(\\.))*?\"

/* Rules section */
%%

"("                                            { fprintf(yyout, "("); }
")"                                            { fprintf(yyout, ")"); }
"{"                                            { fprintf(yyout, "{"); }
"}"                                            { fprintf(yyout, "}"); }
"["                                            { fprintf(yyout, "["); }
"]"                                            { fprintf(yyout, "]"); }
","                                            { fprintf(yyout, ","); }
";"                                            { fprintf(yyout, ";"); }
":"                                            { fprintf(yyout, ":"); }
"\""                                           { fprintf(yyout, "\""); }
"+"                                            { fprintf(yyout, "+"); }
"="                                            { fprintf(yyout, "="); }

"for"                                          { fprintf(yyout, "%d", FOR); }

[0-9]+                                         { fprintf(yyout, "%s", yytext); }
\"([^\\\n]|(\\.))*?\"                          { fprintf(yyout, "%s", yytext); }

[A-Za-z_][A-Za-z0-9_]*                         { fprintf(yyout, "%d", VAR); }
[ \t\n]+                                       { /* Ignore whitespace */ }
.                                              { /* Optionally ignore unknown characters */ }

%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap() { return 1; }
