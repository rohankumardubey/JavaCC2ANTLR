lexer grammar JavaLexer;

SPACE : [ \t\f\u0085\u00A0\u1680\u180E\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200A\u200B\u200C\u200D\u2028\u2029\u202F\u205F\u2060\u3000\uFEFF] -> skip ;
WINDOWS_EOL : '\r\n' -> skip ;
UNIX_EOL : '\n' -> skip ;
OLD_MAC_EOL : '\r' -> skip ;
SINGLE_LINE_COMMENT : '//' (~[\n\r])* -> skip ;
ENTER_JAVADOC_COMMENT : '/**' ~[/] -> skip, pushMode(IN_JAVADOC_COMMENT) ;
ENTER_MULTILINE_COMMENT : '/*' -> skip, pushMode(IN_MULTI_LINE_COMMENT) ;
ABSTRACT : 'abstract'  ;
ASSERT : 'assert'  ;
BOOLEAN : 'boolean'  ;
BREAK : 'break'  ;
BYTE : 'byte'  ;
CASE : 'case'  ;
CATCH : 'catch'  ;
CHAR : 'char'  ;
CLASS : 'class'  ;
CONST : 'const'  ;
CONTINUE : 'continue'  ;
US__DEFAULT : 'default'  ;
DO : 'do'  ;
DOUBLE : 'double'  ;
ELSE : 'else'  ;
ENUM : 'enum'  ;
EXTENDS : 'extends'  ;
FALSE : 'false'  ;
FINAL : 'final'  ;
FINALLY : 'finally'  ;
FLOAT : 'float'  ;
FOR : 'for'  ;
GOTO : 'goto'  ;
IF : 'if'  ;
IMPLEMENTS : 'implements'  ;
IMPORT : 'import'  ;
INSTANCEOF : 'instanceof'  ;
INT : 'int'  ;
INTERFACE : 'interface'  ;
LONG : 'long'  ;
NATIVE : 'native'  ;
NEW : 'new'  ;
NULL : 'null'  ;
PACKAGE : 'package'  ;
PRIVATE : 'private'  ;
PROTECTED : 'protected'  ;
PUBLIC : 'public'  ;
RECORD : 'record'  ;
RETURN : 'return'  ;
SHORT : 'short'  ;
STATIC : 'static'  ;
STRICTFP : 'strictfp'  ;
SUPER : 'super'  ;
SWITCH : 'switch'  ;
SYNCHRONIZED : 'synchronized'  ;
THIS : 'this'  ;
THROW : 'throw'  ;
THROWS : 'throws'  ;
TRANSIENT : 'transient'  ;
TRUE : 'true'  ;
TRY : 'try'  ;
VOID : 'void'  ;
VOLATILE : 'volatile'  ;
WHILE : 'while'  ;
YIELD : 'yield'  ;
REQUIRES : 'requires'  ;
TO : 'to'  ;
WITH : 'with'  ;
OPEN : 'open'  ;
OPENS : 'opens'  ;
USES : 'uses'  ;
MODULE : 'module'  ;
EXPORTS : 'exports'  ;
PROVIDES : 'provides'  ;
TRANSITIVE : 'transitive'  ;
LONG_LITERAL : DECIMAL_LITERAL [lL] | HEX_LITERAL [lL] | OCTAL_LITERAL [lL] | BINARY_LITERAL [lL]  ;
INTEGER_LITERAL : DECIMAL_LITERAL | HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL  ;
fragment DECIMAL_LITERAL : [0-9] (([0-9_])* [0-9])?  ;
fragment HEX_LITERAL : '0' [xX] HEX_DIGITS  ;
fragment OCTAL_LITERAL : '0' [0-7] (([0-7_])* [0-7])?  ;
fragment BINARY_LITERAL : '0' [bB] [01] (([01_])* [01])?  ;
FLOATING_POINT_LITERAL : DECIMAL_FLOATING_POINT_LITERAL | HEXADECIMAL_FLOATING_POINT_LITERAL  ;
fragment DECIMAL_FLOATING_POINT_LITERAL : DECIMAL_LITERAL '.' (DECIMAL_LITERAL)? (DECIMAL_EXPONENT)? ([fFdD])? | '.' DECIMAL_LITERAL (DECIMAL_EXPONENT)? ([fFdD])? | DECIMAL_LITERAL DECIMAL_EXPONENT ([fFdD])? | DECIMAL_LITERAL (DECIMAL_EXPONENT)? [fFdD]  ;
fragment DECIMAL_EXPONENT : [eE] ([+-])? (DECIMAL_LITERAL)+  ;
fragment HEXADECIMAL_FLOATING_POINT_LITERAL : HEX_LITERAL ('.')? HEXADECIMAL_EXPONENT ([fFdD])? | '0' [xX] (HEX_DIGITS)? '.' HEX_DIGITS HEXADECIMAL_EXPONENT ([fFdD])?  ;
fragment HEXADECIMAL_EXPONENT : [pP] ([+-])? DECIMAL_LITERAL  ;
fragment HEX_DIGITS : [0-9a-fA-F] (([0-9a-fA-F_])* [0-9a-fA-F])?  ;
fragment UNICODE_ESCAPE : '\\u' [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]  ;
CHARACTER_LITERAL : '\'' (~['\\\n\r] | '\\' [ntbrf\\'"] | [0-7] ([0-7])? | [0-3] [0-7] [0-7] | UNICODE_ESCAPE) '\''  ;
STRING_LITERAL : '"' (~["\\\n\r] | '\\' [ntbrf\\'"] | [0-7] ([0-7])? | [0-3] [0-7] [0-7] | '\\u' [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f])* '"'  ;
TEXT_BLOCK_LITERAL : '"""' ('\\' '"' | . )*? '"""';
IDENTIFIER : LETTER (PART_LETTER)*  ;
fragment LETTER : [$A-Z_a-z??-??????????-????-????-????-????-????????-????-????-????????-??????-????-????-????-????-??????-??????-????-??????-????-????-??????-????-????-????????-????-??????-????-???????-???????????????-??????-??????-??????-??????-????????????-??????-??????-??????-??????-??????-?????????-????????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-????????????-????????????-??????-??????-??????-??????-??????-?????????-??????-????????????-??????-??????-??????-?????????-??????-??????-??????-????????????-??????-??????-??????-?????????-??????-?????????-??????-??????-??????-??????-????????????-??????-??????-??????-??????-????????????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-?????????-????????????-??????-??????-????????????-??????-??????-?????????-?????????-?????????-??????-??????-??????-?????????-??????-?????????-??????-??????-?????????-????????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-???????????????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-???????????????-??????-????????????-?????????-???????????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-????????????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-????????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-?????????-?????????-??????-????????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-????-????-??????-??????-??????-?????????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-?????????-?????????-??????-??????-??????-??????-??????-??????-??????-???] | UNICODE_ESCAPE  ;
fragment PART_LETTER : [ --$0-9A-Z_a-z-????-????\u00AD??????-????-????-????-????-????????-????-????-????????-??????-????-????-????-????-????-??????-??????-??????-????-??????-????-????-??????-??\u061C??-????-????-????-????-??????-????-????-???????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-?????????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-????????????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-?????????-?????????-??????-??????-??????-??????-??????-??????-?????????-????????????-??????-??????-????????????-??????-??????-??????-?????????-??????-??????-?????????-??????-???????????????-??????-??????-??????-??????-?????????-??????-??????-????????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-???????????????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-????????????-??????-??????-?????????-????????????-?????????-???????????????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-????????????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-????????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-????-????-??????-??????-??????-??????-??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-??????-??????-?????????-??????-???\uFEFF??????-??????-?????????-??????-??????-??????-??????-??????-??????-??????-??????-???] | UNICODE_ESCAPE  ;
LPAREN : '('  ;
RPAREN : ')'  ;
LBRACE : '{'  ;
RBRACE : '}'  ;
LBRACKET : '['  ;
RBRACKET : ']'  ;
SEMICOLON : ';'  ;
COMMA : ','  ;
DOT : '.'  ;
ELLIPSIS : '...'  ;
AT : '@'  ;
DOUBLECOLON : '::'  ;
ASSIGN : '='  ;
LT : '<'  ;
BANG : '!'  ;
TILDE : '~'  ;
HOOK : '?'  ;
COLON : ':'  ;
ARROW : '->'  ;
EQ : '=='  ;
GE : '>='  ;
LE : '<='  ;
NE : '!='  ;
SC_AND : '&&'  ;
SC_OR : '||'  ;
INCR : '++'  ;
DECR : '--'  ;
PLUS : '+'  ;
MINUS : '-'  ;
STAR : '*'  ;
SLASH : '/'  ;
BIT_AND : '&'  ;
BIT_OR : '|'  ;
XOR : '^'  ;
REM : '%'  ;
LSHIFT : '<<'  ;
PLUSASSIGN : '+='  ;
MINUSASSIGN : '-='  ;
STARASSIGN : '*='  ;
SLASHASSIGN : '/='  ;
ANDASSIGN : '&='  ;
ORASSIGN : '|='  ;
XORASSIGN : '^='  ;
REMASSIGN : '%='  ;
LSHIFTASSIGN : '<<='  ;
RSIGNEDSHIFTASSIGN : '>>='  ;
RUNSIGNEDSHIFTASSIGN : '>>>='  ;
RUNSIGNEDSHIFT : '>>>'  ;
RSIGNEDSHIFT : '>>'  ;
GT : '>'  ;
CTRL_Z : '\u001A'  ;

mode IN_JAVADOC_COMMENT;
IN_JAVADOC_COMMENT_JAVADOC_COMMENT : '*/' -> skip, popMode ;
IN_JAVADOC_COMMENT_COMMENT_CONTENT : . -> skip ;

mode IN_MULTI_LINE_COMMENT;
IN_MULTI_LINE_COMMENT_MULTI_LINE_COMMENT : '*/' -> skip, popMode ;
IN_MULTI_LINE_COMMENT_COMMENT_CONTENT : . -> skip ;

