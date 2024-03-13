

Literal: NONE | TRUE | FALSE | Number | UniCodeString | AsciiString | ByteBuffer

Variable: Identifier


AccessConst:
    Variable
    | NameSpace CCOLON Identifier

Template:
    LT TypeList GT  

TypeRef:
    NameSpace CCOLON TypeName Template
    | NameSpace CCOLON TypeName
    | TypeName Template
    | TypeName 


UnOp: 
    PLUS Exp %prec UPLUS
    | MINUS Exp %prec UMINUS
    | EXCLAM Exp %prec UEXCLAM

TypeOp: 
    Exp QUESTION LT TypeRef GT 
    | Exp AT LT TypeRef GT

BinLogic: 
    Exp AND Exp 
    | Exp OR Exp 
    | Exp IMPLY Exp

BinArith: 
    Exp PLUS Exp 
    | Exp MINUS Exp


BinCmp:
    Exp LT Exp 
    | Exp GT Exp
    | Exp EQEQ Exp 
    | Exp NOTEQ Exp


AccessMember:
    Exp PERIOD Identifier 
    | Exp PERIOD Number
    ;    

Cons:
    LBRACE ConsArgs LBRACE
    | LBRACKET ConsArgs RBRACKET
    | LBRACKET ConsMapArgs RBRACKET
    ;



Invoke: 
    Exp PERIOD Identifier  LT TemplateList GT LPAREN ArgList RPAREN  
    | Exp PERIOD Identifier  LPAREN ArgList RPAREN 
    ;



FCall:
    NameSpace CCOLON Identifier LPAREN ArgList RPAREN
    | Identifier LPAREN ArgList RPAREN
    ;

Exp:
    Invoke
    | LPAREN Exp RPAREN
    | Literal
    | AccessMember
    | AccessConst
    | UnOp
    | TypeOp
    | BinLogic
    | BinArith
    | BinCmp
    | Cons
    | FCall
    | error SEMI {  yyerror(error_count, "\033[1;31m Improper Expression \033[0m"); yyerrok; }
    ;


    




  






