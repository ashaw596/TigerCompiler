grammar Tiger;

options {
    // antlr will generate java lexer and parser
    language = Java;
    // generated parser should create abstract syntax tree
    output = AST;
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

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

/* PARSER RULES */
tiger_prog: type_dec_list funct_dec_list main_funct;

funct_dec_list : funct_dec funct_dec_list | ;
funct_dec : ret_type FUNCTION ID LPAREN param_list RPAREN BEGIN block_list END SEMI;

main_funct : VOID MAIN LPAREN RPAREN BEGIN block_list END;

ret_type : type_id | VOID;

param_list : param param_list_tail | ;
param_list_tail	: COMMA param param_list_tail | ;
param :	ID COLON type_id;

block_list : block block_tail;
block_tail : block block_tail | ;
block : BEGIN dec_seg stat_seq END SEMI;

dec_seg : type_dec_list var_dec_list;
type_dec_list : type_dec type_dec_list | ;
var_dec_list : var_dec var_dec_list | ;

type_dec : TYPE ID EQ type;
type : base_type 
     | ARRAY LBRACK INTLIT RBRACK OF base_type 
     | ARRAY LBRACK INTLIT RBRACK LBRACK INTLIT RBRACK OF base_type;
type_id : base_type | ID;
base_type : INT | FIXEDPT;

var_dec : VAR id_list COLON type_id optional_init;
id_list : ID | ID COMMA id_list;
optional_init : ASSIGN const | ;

stat_seq : stat | stat stat_seq;

stat : val ASSIGN expr SEMI
     | IF expr THEN stat_seq ENDIF SEMI
     | IF expr THEN stat_seq ELSE stat_seq ENDIF SEMI
     | WHILE expr DO stat_seq ENDDO SEMI
     | FOR ID ASSIGN index_expr TO index_expr DO stat_seq ENDDO SEMI
     | opt_prefix ID LPAREN expr_list RPAREN SEMI
     | BREAK SEMI
     | RETURN expr SEMI
     | block SEMI;

opt_prefix : val ASSIGN | ;

expr : const expr_tail
     | val expr_tail
     | LPAREN expr RPAREN expr_tail;
     
expr_tail : 
	  | binary_op expr expr_tail;		

const : INTLIT | FIXEDPTLIT;

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
val_tail : 
	 | LBRACK index_expr RBRACK
	 | LBRACK index_expr RBRACK LBRACK index_expr RBRACK;

index_expr : INTLIT index_expr_tail
	   | ID index_expr_tail;

index_expr_tail : | index_oper index_expr;
	     
index_oper : PLUS
	   | MINUS
	   | MULT;
