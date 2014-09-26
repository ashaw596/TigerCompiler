lexer grammar Tiger;
options {
	language = Java;
}

ID: (('a'..'z')|('A'..'Z')) (('a'..'z')|('A'..'Z')|('0'..'9')|'_')*;

INTLIT:	('1'..'9')('0'..'9')*;




