CC = g++
LEX = flex
LFLAGS = -ll
SCANNER = scanner

.SILENT:

all: $(SCANNER)

lex.yy.c: tokenizer.l
	$(LEX) tokenizer.l

$(SCANNER): lex.yy.c
	$(CC) -o $(SCANNER) lex.yy.c $(LFLAGS)

clean:
	rm -f lex.yy.c $(SCANNER)
	