


Scalar:
    SCALAR TypeName EQ TypeRef SEMI
    | SCALAR TypeName EQ TypeRef LBRACE RequiresList RBRACE
    ;

Model:
    MODEL TypeName LBRACE RBRACE
    | MODEL TypeName LBRACE PropertyList RBRACE
    | MODEL TypeName LBRACE RequiresList RBRACE
    | MODEL TypeName LBRACE PropertyList RequiresList RBRACE
    | MODEL TypeName EXTENDS TypeRef LBRACE RBRACE
    | MODEL TypeName EXTENDS TypeRef LBRACE PropertyList RBRACE
    | MODEL TypeName EXTENDS TypeRef LBRACE RequiresList RBRACE
    | MODEL TypeName EXTENDS TypeRef LBRACE PropertyList RequiresList RBRACE
    ;

RequiresList:
    Requires
    | Requires RequiresList
    ;

Requires: 
    REQUIRES COLON Exp SEMI 
    | error SEMI { yyerror(error_count, "\033[1;31m Improper Model/Scalar \033[0m");  yyerrok; }
    ;

PropertyList:
    Property
    | Property PropertyList 
    ;

Property: 
    Identifier COLON TypeRef SEMI
    ;



