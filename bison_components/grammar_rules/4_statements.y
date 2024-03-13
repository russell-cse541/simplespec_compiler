
Empty: SEMI ;
    
Declare: LET Identifier COLON TypeRef EQ Exp SEMI ;
    
Return: RETURN Exp SEMI ;

Cond: 
    IF LPAREN Exp RPAREN LBRACE StatementList RBRACE 
    | IF LPAREN Exp RPAREN LBRACE StatementList RBRACE ELSE LBRACE StatementList RBRACE
    | IF LPAREN Exp RPAREN LBRACE StatementList RBRACE ElifList ELSE LBRACE StatementList RBRACE
    ;
    
ElifList:
    ELIF LPAREN Exp RPAREN  LBRACE StatementList RBRACE 
    |  ELIF LPAREN Exp RPAREN  LBRACE StatementList RBRACE  ElifList
    ;

Statement: 
    Empty 
    | Declare 
    | Return 
    | Cond 
    | error SEMI {  yyerror(error_count, "\033[1;31m Improper Statement \033[0m"); yyerrok; }
    ;



StatementList: 
    Statement 
    | StatementList Statement 
    ;

