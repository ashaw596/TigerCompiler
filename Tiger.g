grammar Tiger;

options {
    output=AST;
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

ID : 'id';

TO : 'to';

DO : 'do';

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

EQ : '=';
 
NEQ : '<>';

LESSER : '<';

LESSEREQ : '<=';

GREATER : '>';

GREATEREQ : '>=';

AND : '&';

OR : '|';

ASSIGN ':='; 

/* other lexical rules */
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


