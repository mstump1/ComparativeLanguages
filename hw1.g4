grammar hw1;

/** program -> stmt_list $$
    stmt_list -> stmt stmt_list | e
    stmt -> id := expr | read id | write expr
    expr -> term term_tail
    term_tail -> add_op term term_tail| e
    term -> factor factor_tail
    factor_tail -> mult_op factor factor_tail | e
    factor -> ( expr ) | id | number
    add_op -> + | -
    mult_op -> * | /

    LL(1) grammar
**/

//start
program:    stmt_list;
stmt_list:  stmt stmt_list | /*epsilon*/;
stmt:   ID ':=' expr | 'read' ID | 'write' expr;
expr: term term_tail;
term_tail: add_op term term_tail | /*epsilon*/;
term: factor factor_tail;
factor_tail: mult_op factor factor_tail | /*epsilon*/;
factor: '(' expr ')' | ID | NUMBER;
add_op: '+' | '-';
mult_op: '*' | '/';

//new line
NEWLINE: '\r'? '\n' ;
ID:  ('a'..'z'|'A'..'Z')+ ;
NUMBER: '0'..'9'+ ;

// skip spaces, tabs, newlines
WS : [ \t\r\n]+ -> skip ;