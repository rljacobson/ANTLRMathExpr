grammar MathExpression;

//Parser Rules
expr
	:	LEAF
	|	'(' expr ')'	//parentheses
	|	('+' | '-') expr //unary plus/minus
	|	<assoc=right> expr '^' expr
	|	expr expr //implicit multiplication
	|	expr ('/' | '*') expr //division and explicit multiplication
	|	expr ('+' | '-') expr //addition/subtraction
//	|	expr '&' //postfix parenthesization. 
	;

//Lexer Rules
LEAF	:	ID | INT;

INT :   [0-9]+ ;
ID 	:	[a-zA-Z]+	;
WS  :   [ \t\r\n]+ -> skip ;