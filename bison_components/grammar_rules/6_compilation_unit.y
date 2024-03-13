
Function:
    FUNCTION Identifier LPAREN SigList RPAREN COLON TypeRef LBRACE StatementList RBRACE ;


SigList:
    Sig
    | Sig COMMA SigList
    |
    ;

Sig: Identifier COLON TypeRef ;

Const: CONST Identifier COLON TypeRef EQ Exp SEMI ;

Alias: ALIAS TypeRef EQ TypeRef SEMI ;

Using: 
    USING NameSpace SEMI 
    ;

DeclList: 
    Decl 
    | DeclList Decl 
    ;

Decl: 
    Function 
    | Const 
    | Alias 
    | Scalar 
    | Model
    ;

UsingList:
    Using
    | UsingList Using
    ;


NamespaceDecl: 
    NAMESPACE NameSpace SEMI 
    | NAMESPACE NameSpace SEMI UsingList
    | NAMESPACE NameSpace SEMI DeclList
    | NAMESPACE NameSpace SEMI UsingList DeclList 
    | error SEMI {  yyerror(error_count, "\033[1;31m Improper Declaration \033[0m"); yyerrok; }
    ;








