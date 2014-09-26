grammar Tiger;
options {
	language = Java;
	 output = AST;
}
@lexer::header {
package org.meri.antlr_step_by_step.parsers;
}

//as the generated parser will reside in org.meri.antlr_step_by_step.parsers 
//package, we have to add package declaration on top of it
@parser::header {
package org.meri.antlr_step_by_step.parsers;
}
ID: (('a'..'z')|('A'..'Z')) (('a'..'z')|('A'..'Z')|('0'..'9')|'_')*;

INTLIT:	('1'..'9')('0'..'9')*;

expression : ID;


