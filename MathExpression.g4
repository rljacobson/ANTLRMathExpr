grammar MathExpression;

//Parser Rules
expr
	:	LEAF
	|	LPAREN expr RPAREN	//parentheses
	|	<assoc=right> expr POWER expr
	|	(PLUS | MINUS) expr //unary plus/minus
	|	expr { _input.LT(1).getType() != PLUS }? expr //implicit multiplication
	|	expr (DIV | MUL) expr //division and explicit multiplication
	|	expr (PLUS | MINUS) expr //addition/subtraction
	|	expr '&' //postfix parenthesization. 
	;

//Lexer Rules

PLUS		:	'+'	;
MINUS	:	'-'	;
	
DIV	:	'/'	;
MUL	:	'*'	;
LPAREN	:	'('	;
RPAREN	:	')'	;
POWER	:	'^'	;
AMP		:	'&'	;

LEAF	:	ID | INT;
fragment
INT :   [0-9]+ ;
fragment
ID 	:	[a-zA-Z]+	;
WS  :   [ \t\r\n]+ -> skip ;