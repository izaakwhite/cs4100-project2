CC = g++
LEX = flex
LFLAGS = -ll
SCANNER = scanner

.SILENT:

all: $(SCANNER)

lex.yy.c: tokenizer_no_yytext.l
	$(LEX) tokenizer_no_yytext.l

$(SCANNER): lex.yy.c
	$(CC) -o $(SCANNER) lex.yy.c $(LFLAGS)

clean:
	rm -f lex.yy.c $(SCANNER)
	