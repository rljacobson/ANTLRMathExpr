grammar MathExpression;

//Parser Rules
term
	:	LEAF
	|	'(' expr ')'	//parentheses
	;

//Implicit multiplication
factor
	:	term
	|	<assoc=right> term '^' factor //power
	|	term factor //implicit multiplication.
	;

//Unary minus/plus
expr
	:	factor
	|	('+' | '-') expr //unary plus/minus
	|	expr ('/' | '*') expr //division and explicit multiplication 
	|	expr ('+' | '-') expr	//addition/subtraction
	|	expr '&' //low-precedence postfix operator
	;

//Lexer Rules
LEAF	:	ID | INT;

INT :   [0-9]+ ;
ID 	:	[a-zA-Z]+	;
WS  :   [ \t\r\n]+ -> skip ;