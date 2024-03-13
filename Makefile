# all:  lexer

# tsp.tab.h: tsp.y
# 	bison -d tsp.y

# lex.yy.c: tsp.tab.h tsp.l
# 	flex tsp.l

# lexer: lex.yy.c
# 	gcc -o lexer tsp.tab.c lex.yy.c  -ll -Wall

# lexer-debug: lex.yy.c
# 	gcc -o lexer-debug tsp.tab.c lex.yy.c -DDEBUG -ll -Wall

# lexer-test: lexer-debug
# 	sh lexer_test_script.sh

GRAMMAR_FILES := $(wildcard bison_components/grammar_rules/*.y)
GRAMMAR_OUTPUT := bison_components/grammar_rules.y

grammar: $(GRAMMAR_FILES)
	cat $^ > $(GRAMMAR_OUTPUT)

build_bison: grammar
	cat bison_components/c_declarations.y > tsp.y
	echo "\n" >> tsp.y
	cat bison_components/bison_declarations.y >> tsp.y 
	echo "\n" >> tsp.y
	cat bison_components/tokens.y >> tsp.y
	echo "\n%%\n" >> tsp.y
	cat bison_components/grammar_rules.y >> tsp.y
	echo "\n%%\n" >> tsp.y
	cat bison_components/general_c_code.y >> tsp.y

all: build_bison tsp.l tsp.y
	bison -d tsp.y
	flex tsp.l
	gcc -o tsp tsp.tab.c lex.yy.c -ll  -Wall

test: clean all
	sh test_suite.sh

clean:
	rm -f tsp.tab.c lex.yy.c tsp.tab.h tsp.y tsp bison_components/grammar_rules.y 