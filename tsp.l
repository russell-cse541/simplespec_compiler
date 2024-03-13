%option nounput
%option noinput

%{

#ifdef DEBUG
    #define DEBUG_PRINT(x) printf x
#else
    #define DEBUG_PRINT(x) do { } while(0)
#endif
# define YY_ACTION(x)                                                                                                   \
    yylval.stringVal = strdup(yytext);                                                                                  \
    yylval.tokenNum = (x);                                                                                              \
    yylloc.first_line = yylloc.last_line = yylineno;                                                                    \
    yylloc.first_column = yycolumn;                                                                                     \
    yylloc.last_column = yycolumn + yyleng - 1;                                                                         \
    DEBUG_PRINT(("\n%-20d   TagNum: %-4d   Line: %-4d  Col: %-4d",yylval.intVal,(x),yylineno,yycolumn));                \
    yycolumn += yyleng;                                                                                                 \
    return x;  
# define YY_NUM_ACTION(x)                                                                                               \
    if (x == INUM || x == NNUM)  {                                                                                      \
        yytext[strlen(yytext)-1]='\0';                                                                                  \
    }                                                                                                                   \
    yylval.intVal = atoi(yytext);                                                                                       \
    yylval.tokenNum = (x);                                                                                              \
    yylloc.first_line = yylloc.last_line = yylineno;                                                                    \
    yylloc.first_column = yycolumn;                                                                                     \
    yylloc.last_column = yycolumn + yyleng - 1;                                                                         \
    DEBUG_PRINT(("\n%-20d   TagNum: %-4d   Line: %-4d  Col: %-4d",yylval.intVal,(x),yylineno,yycolumn));                \
    yycolumn += yyleng;                                                                                                 \
    return x;  


#include <stdio.h>
#include <string.h>
#include "tsp.tab.h"
extern YYLTYPE yylloc;
extern YYSTYPE yylval; 
int yycolumn = 1;
void yyerror(int *error_count, const char *s);
%}

DIGIT           [0-9]
TNS   [A-Z][a-zA-Z0-9]*
ID              [a-z][a-zA-Z0-9]*
BB      0x\[(0|([a-f1-9][a-f0-9]*))\]
NNUMBER          ((-?[1-9][0-9]*)|0|-0)n
INUMBER          ((-?[1-9][0-9]*)|0|-0)i
NUMBER           ((-?[1-9][0-9]*)|0|-0)
ACSII           \'[ -~]*\'
UNIC            ["]([^"\\\n]|\\(.|\n))*["]

%%

"//".*      { /* do nothing for comments */ }  
{ACSII}         { YY_ACTION(ASTRING)}
{UNIC}          { YY_ACTION(USTRING)}
"namespace"     { YY_ACTION(NAMESPACE) }
"using"         { YY_ACTION(USING) }
"const"         { YY_ACTION(CONST) }
"model"         { YY_ACTION(MODEL) }
"extends"       { YY_ACTION(EXTENDS) }
"alias"         { YY_ACTION(ALIAS) }
"requires"      { YY_ACTION(REQUIRES) }
"scalar"        { YY_ACTION(SCALAR) }
"function"      { YY_ACTION(FUNCTION) }
"return"        { YY_ACTION(RETURN) }
"fn"            { YY_ACTION(FN) }
"pred"          { YY_ACTION(PRED) }
"let"           { YY_ACTION(LET) }
"if"            { YY_ACTION(IF) }
"elif"          { YY_ACTION(ELIF) }
"else"          { YY_ACTION(ELSE) }
"true"          { YY_ACTION(TRUE) }
"false"         { YY_ACTION(FALSE) }
"none"          { YY_ACTION(NONE) }
{TNS}           { YY_ACTION(TYPENAMESPACE) }
{BB}            { YY_ACTION(BYTEBUFFER) }
{ID}            { YY_ACTION(IDENT) }
{NNUMBER}       { YY_NUM_ACTION(NNUM) }
{INUMBER}       { YY_NUM_ACTION(INUM) }
{NUMBER}        { YY_NUM_ACTION(NUM) }
"==>"           { YY_ACTION(IMPLY) }
"&&"            { YY_ACTION(AND) }
"||"            { YY_ACTION(OR) }
"!="            { YY_ACTION(NOTEQ) }
"=>"            { YY_ACTION(EQAR) }
"=="            { YY_ACTION(EQEQ) }
"::"            { YY_ACTION(CCOLON) }
"="             { YY_ACTION(EQ) }
"<"             { YY_ACTION(LT) }
">"             { YY_ACTION(GT) }
"!"             { YY_ACTION(EXCLAM) }
"+"             { YY_ACTION(PLUS) }
"-"             { YY_ACTION(MINUS) }
"("             { YY_ACTION(LPAREN) }
")"             { YY_ACTION(RPAREN) }
"["             { YY_ACTION(LBRACKET) }
"]"             { YY_ACTION(RBRACKET) }
"{"             { YY_ACTION(LBRACE) }
"}"             { YY_ACTION(RBRACE) }
";"             { YY_ACTION(SEMI) }
","             { YY_ACTION(COMMA) }
":"             { YY_ACTION(COLON) }
"."             { YY_ACTION(PERIOD) }
"@"             { YY_ACTION(AT) }
"?"             { YY_ACTION(QUESTION) }
"|"             { YY_ACTION(BAR) }  
[ \t]+          { yycolumn += yyleng; }    
"\n"            { yycolumn = 1; ++yylineno; }
.               { 
                    char error_message[50];
                    sprintf(error_message, "Unrecognized character: %s  => Line %d Col %d", yytext, yylineno,yycolumn);
                    printf("\n%s\n" , error_message);
                    YY_ACTION(ERROR)
                }

%%

int yywrap() {
    return 1;
}