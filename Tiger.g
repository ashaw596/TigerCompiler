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
tiger_prog: type_dec-list funct_dec_list main_funct;
funct_dec-list: func_dec funct_dec_list | /* epsilon */;
funct_dec: ret_type FUNCTION ID LPAREN param_list RPAREN BEGIN block_list END SEMI;
main_funct: VOID MAIN LPAREN RPAREN BEGIN block_list END;
ret_type: type_id | VOID;
parm_list: param param_list_tail | ;
param_list_tail	: COMMA param param_list_tail | ;
param:	ID COLON type-id;
block_list: block block_tail;
block_tail: block block_tail| ;
block	:	 BEGIN dec_seg stat_seq END SEMI;

dec_seg	:	type_dec_list var_dec_list;
type_dec_list	: type_dec type_dec_list | ;
var_dec_list	: var_dec var_dec_list | ;
type_dec :	TYPE ID EQ type;
type	:	base_type | ARRAY LBRACK INTLIT RBRACK OF base_type | ARRAY LBRACK INTLIT RBRACK LBRACK INTLIT RBRACK OF base_type ;
base_type	:	 INT | FIXEDPT;


 


 


