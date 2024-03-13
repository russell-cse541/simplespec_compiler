

ArgList:
    Exp
    | Exp COMMA ArgList
    | Lambda
    | Lambda COMMA ArgList
    |
    ;

ConsArgs:
    Exp
    | Exp COMMA ConsArgs
    ;

ConsMapArgs:
    Exp EQAR Exp
    | Exp EQAR Exp COMMA ConsMapArgs
    ;

Lambda:
    FN LPAREN SigList RPAREN COLON TypeRef EQAR Exp 
    | PRED LPAREN SigList RPAREN COLON TypeRef EQAR Exp 
    ;

TypeList:
    TypeRef
    | TypeRef COMMA TypeList

TemplateList:
    Template
    | Template COMMA TemplateList
    ;




    
    

