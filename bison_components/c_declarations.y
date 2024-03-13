%{
#include <stdio.h>
extern int yylex(void); 
extern void yyerror(int *error_count, const char *s);
extern FILE *yyin;
extern void yyrestart(FILE *new_file);

%}