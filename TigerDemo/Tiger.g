grammar Tiger;

options {
    output=AST;
}

/* LEXER RULES */

ID : (('a'..'z')|('A'..'Z')) (('a'..'z')|('A'..'Z')|('0'..'9')|'_')*;

INTLIT : ('1'..'9')('0'..'9')*;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

/* PARSER RULES */
eval: ID;

