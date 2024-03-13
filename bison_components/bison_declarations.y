%union {
    char *stringVal;
    int intVal;
    int tokenNum;
}

%parse-param { int* error_count }

%locations 

%expect 0

%right EQ 
%left AT BAR QUESTION
%left IMPLY
%left OR
%left AND
%left EQEQ NOTEQ
%left GT LT
%left PLUS MINUS
%right UMINUS UPLUS UEXCLAM
%left  EQAR
%left PERIOD
%left CCOLON

%start NamespaceDecl