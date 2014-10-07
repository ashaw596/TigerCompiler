grammar Tiger;

options {
    // antlr will generate java lexer and parser
    language = Java;
    // generated parser should create abstract syntax tree
    output = AST;
    
    k = 1; 
    backtrack = no; 
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

INTLIT : (('1'..'9')('0'..'9')*)| '0';

FIXEDPTLIT : INTLIT'.'('0'..'9')((('0'..'9')('0'..'9'))|(('0'..'9')?));

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

/* PARSER RULES */
tiger_prog: type_dec_list funct_dec_void main_funct;

funct_dec_void	: VOID ( funct_dec_list_no_void |);
funct_dec_list_no_void	: funct_dec_no_void ((funct_dec_not_void) VOID funct_dec_list_no_void |(VOID(|funct_dec_list_no_void)));

funct_dec_list : | funct_dec funct_dec_list;
funct_dec_not_void : ret_type_no_void funct_dec_no_void;
funct_dec : ret_type FUNCTION ID LPAREN param_list RPAREN BEGIN block_list END SEMI;

funct_dec_no_void : FUNCTION ID LPAREN param_list RPAREN BEGIN block_list END SEMI;

main_funct : MAIN LPAREN RPAREN BEGIN block_list END SEMI;
ret_type_no_void : type_id;	
ret_type : type_id | VOID;

param_list : param param_list_tail | ;
param_list_tail	: COMMA param param_list_tail | ;
param :	ID COLON type_id;

block_list : block block_tail;
block_tail : block block_tail | ;
block : BEGIN dec_seg stat_seq END SEMI;

dec_seg : type_dec_list var_dec_list;
type_dec_list : | type_dec type_dec_list;
var_dec_list : var_dec var_dec_list | ;

type_dec : TYPE ID EQ type SEMI;
type : base_type 
     | ARRAY LBRACK INTLIT RBRACK ((OF base_type)|(LBRACK INTLIT RBRACK OF base_type));
type_id : base_type | ID;
base_type : INT | FIXEDPT;

var_dec : VAR id_list COLON type_id optional_init SEMI;
id_list : ID (COMMA id_list)?;
optional_init : ASSIGN constant | ;

stat_seq : stat stat_seq_2;

stat_seq_2 : | stat;

/* Non-LL decision */

stat : ID ((val_tail ASSIGN  (ID (expr_id_pre SEMI| LPAREN expr_list RPAREN SEMI) | expr_no_id SEMI)) |(LPAREN expr_list RPAREN SEMI))
     | IF expr THEN stat_seq stat_2
     | WHILE expr DO stat_seq ENDDO SEMI
     | FOR ID ASSIGN index_expr TO index_expr DO stat_seq ENDDO SEMI
     | BREAK SEMI
     | RETURN expr SEMI
     | block;
     
stat_2 : ENDIF SEMI | ELSE stat_seq ENDIF SEMI;

opt_prefix : val ASSIGN | ;

expression : constant
     	   | val;
expr_no_id : 	((expression_no_id) ((binary_op expr_op)| ))
	   	|(LPAREN  expr RPAREN);
expression_no_id : 	constant;
expr_id_pre : ((expression_id_pre) ((binary_op expr_op)| ));
expression_id_pre: val_tail;	
     	   
expr	: ((expression) ((binary_op expr_op)| ))
	| LPAREN  expr RPAREN;
	

expr_op : expression ( binary_op expr_op |);
     
/* The following matches can never be matched: 2 */	

constant : INTLIT | FIXEDPTLIT;

binary_op : PLUS 
	  | MINUS
	  | MULT
	  | DIV
	  | EQ
	  | NEQ
	  | LESSER
      	  | GREATER
	  | LESSEREQ
	  | GREATEREQ 
	  | AND
	  | OR;

expr_list : expr expr_list_tail | ;
expr_list_tail : COMMA expr expr_list_tail | ;

val : ID val_tail;
	 
val_tail : | LBRACK index_expr RBRACK val_tail_2;

val_tail_2 : | LBRACK index_expr RBRACK;

index_expr : INTLIT index_expr_tail
	   | ID index_expr_tail;

index_expr_tail : | index_oper index_expr;
	     
index_oper : PLUS
	   | MINUS
	   | MULT;
