# Compiler Project - Parser

This README has been updated to reflect the changes related to the parsing assignment.  The project source code has been updated significantly including changes to Lexer functionality.  

My understanding about the mechanics of the SimpleSpec language will improve with each assignment.  A few assumptions (listed below) have been made based on my understanding of the language at the moment.  I anticipate each assignment iteration of this compiler project will bring more Bison, Flex, and language features into scope.  As such, I want to approach each assignment with a simple and general implementation.

## Updates based on feedback from lexer assignment
Here are the changes as a result of the feedback from the lexer assignment.

- Allowing unicode string literals that may include items like a smiley face.
- ASCII strings can now contain single quotes if they are escaped. 
- Unicode strings can now contain double quotes if they are escaped. 

## How To Use Parser

Below is a quick overview of how to use my SimpleSpec language parser.

- The makefile target `make all` will do all the necessary work to build the parser binary that will be named `tsp`.
- The parser will accept multiple input files. Below is example usage.
    ```
    ./tsp   file1.tsp   file2.tsp
    ```
- For every source file that parsers successfully, the parser will display the simple message `Accepted`.
- If a source file fails to successfully parse, the parser will **attempt** to provide feedback to help the user correct the errors. 
- The parser will attempt to parse all input source files even if one fails.  In this case,  input files that successfully parse will generate the green `Accepted` output.   Typical errors will be displayed for files that fail to parse.

### Error Recovery
The parser is able to recover from parsing mistakes so that the user can see multiple parsing errors.  Below are a list of items related to error recovery.

- Parsing help messages are displayed in red so they can be easily seen by the user.
- There are three different parsing error help messages:
    - `Improper Expression`
    - `Improper Statement`
    - `Improper Model/Scalar`
    - `Improper Declaration`
- Help messages are generated using the Bison `error` feature in grammar rules. 
- The grammar `error` features absorb errors up to a semicolon.  
- Given the grammar structure of the language and the way `error` absorbs information, it is possible for some generic errors to be displayed to the user.  In general, the generic errors will display `Error: syntax error`. 
- Every error message contains a line number.  A developer using my parser should start at the top of the list of errors.
- It is certainly possible that correcting one error will allow the parser to report another error not displayed initially.
- Line numbers and help messages aim to provide the user with some form of starting point toward fixing errors.  Some errors may cause misleading line numbers and suggestions.


## General Overview of MakeFile and Parser Development

Below are some important points about the functionality of my parser.

- All potential grammar shift-reduce issues are reconciled through associativity and precedence Bison declarations.
- There are no Bison, Flex, or compiler errors or warnings.
- MakeFile Targets
    - **`make all`** : This target will do all the necessary compilation to create the parser binary.
    - **`make test`** : This target will build the parser binary and run the QA test suite.
    - **`make grammar`** : The Bison grammar rules are organized into 6 different files that correspond to the structure provided in the assignment prompt.  The individual files are found in the `bison_components/grammar_rules` directory. This make target essentially concatenates the 6 files into a single file `grammar_rules.y` found in the `bison_components` directory.
    - **`make build_bison`** : Calling this target will do everything necessary to build the Bison file `tsp.y`.  This target concatenates the files below:
        - `bison_declarations.y` : Contains the basic Bison declarations such as precedence and associativity rules.
        - `c_declarations` : Contains the `include` and `extern` C-compiler information.
        - `general_c_code.y` : Contains the `main` function to drive the parser.
        - `grammar_rules.y`: Created by the makefile by concatenating smaller grammar component files.
        - `tokens.y` : Declares the terminal tokens.

## Assumptions

Below are some general functionality assumptions that have been made.

- Every SimpleSpec program declares a `namespace` and can use other namespaces with the keyword `using`. I believe this implies each source file should be effectively treated, at least by the parser, as a standalone parsing unit. 
    - If a source file fails to parse, the Bison/Flex function `yyrestart` is called on `yyin` before parsing the next file. Evidently Bison/Flex has features incorporated into `yyparse()` and `yyin` to help facilitate and fuse multiple input files.
- I may not fully understand `Cons`. The non-terminal `Cons` is only defined in the grammar document on page 2 (expressions) but is not used in the grammar rules.  Given that most every item on page 2 is listed as a grammar rule for `Exp`, I assume `Cons` should be included as a rule for non-terminal `Exp`. If this assumption is incorrect, it will likely become evident in future assignments.
- To prevent unused grammar rule warnings, certain operations were manually expanded within the expression grammar rules.


## Bison and Flex Versions
Below is a list of versions and information related to software used to complete this project.

- Flex Version: flex 2.6.4 Apple(flex-34)
- Bison Version: bison (GNU Bison) 2.3
- Computer: Apple Silicon M2
- Operating System: macOS Sonoma 14.3.1
- C Compiler: Apple clang version 15.0.0 (clang-1500.1.0.2.5)  -  arm64-apple-darwin23.3.0
- Some compiler flags appear to be different than on other systems.  
    -  My computer requires the compiler flag (-ll). Documentation and online recipes indicate using flag (-lfl). 
    -  The C compiler indicates the Flex/Bison versions may be inpcompatible with my OS. There does not appear to be any actual problems and online discussions indicate the warning should be ignored.

