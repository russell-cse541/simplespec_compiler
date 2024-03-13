int main(int argc, char **argv) {
    int error_count = 0;
    if (argc <= 1) {
        fprintf(stderr, "No files provided\n");
        return 1;
    }


    for (int i = 1; i < argc; i++) {
        error_count = 0;
        FILE *file = fopen(argv[i], "r");
        if (!file) {
            fprintf(stderr, "Could not open %s\n", argv[i]);
            continue;
        }

        yyin = file;

        if (yyparse(&error_count) == 0 && error_count == 0) {
            printf("\033[0;32m%s\033[0m\n", "Accepted");
        } else {
            printf("\n\n\033[0;33m There were errors parsing the document. Start by fixing the initial error.  Other errors may be uncovered as some are corrected.\033[0m\n\n");
            yyrestart(yyin);
        }

        fclose(file);
    }

    return 0;
}

void yyerror(int *error_count, const char *s) {
    (*error_count)++;
    fprintf(stdout, "Error: %s line: %d\n", s,yylloc.first_line);
}