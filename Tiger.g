grammar Tiger;

options {
    // antlr will generate java lexer and parser
    language = Java;
    // generated parser should create abstract syntax tree
    output = AST;
}

//as the generated lexer will reside in org.meri.antlr_step_by_step.parsers 
//package, we have to add package declaration on top of it
@lexer::header {
package org.meri.antlr_step_by_step.parsers;
}

//as the generated parser will reside in org.meri.antlr_step_by_step.parsers 
//package, we have to add package declaration on top of it
@parser::header {
package org.meri.antlr_step_by_step.parsers;
}


/* LEXER RULES */

/* Reserved Keywords */
FUNCTION : 'function';

BEGIN : 'begin';

END : 'end';

VOID : 'void';

MAIN : 'main';

TYPE : 'type';

ARRAY : 'array';

OF : 'of';

INT : 'int';

FIXEDPT : 'fixedpt';

VAR : 'var';

IF : 'if';

THEN : 'then';

ENDIF : 'endif';

ELSE : 'else';

WHILE : 'while';

DO : 'do';

ENDDO: 'enddo';

FOR : 'for';

TO : 'to';

BREAK : 'break';

RETURN : 'return';

/* Punctuation Symbols / Binary operators*/
COMMA : ',';

COLON : ':';

SEMI : ';';

LPAREN : '(';

RPAREN : ')';

LBRACK : '[';

RBRACK : ']';

PLUS : '+';

MINUS : '-';

MULT : '*';

DIV : '/';

NEQ : '<>';

LESSEREQ : '<=';

GREATEREQ : '>=';

LESSER : '<';

GREATER : '>';

AND : '&';

OR : '|';

ASSIGN 	: ':='; 

EQ : '=';

/* other lexical rules */
ID : (('a'..'z')|('A'..'Z')) (('a'..'z')|('A'..'Z')|('0'..'9')|'_')*;

INTLIT : ('1'..'9')('0'..'9')*;

FIXEDPTLIT : INTLIT'.'('0'..'9')((('0'..'9')('0'..'9'))|(('0'..'9')?));

LCOMMENT: '/*';

RCOMMENT: '*/';

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;


/* PARSER RULES */
eval: ID;


