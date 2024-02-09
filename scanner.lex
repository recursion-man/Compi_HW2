%{
/* Declarations section*/
#include <stdio.h>
#include "parser.tab.hpp"
#include "output.hpp"
void error();
%}

%option yylineno
%option noyywrap


digit ([0-9])
letter ([a-zA-Z])
whitespace ([ \n\r\t])
binop (\+|-|\/|\*)
relop (==|!=|<|>|<=|>=)
number (0|[1-9][0-9]*)
id ({letter}({digit}|{letter})*)
string (\"([^\n\r\"\\]|\\[rnt"\\])+\")
comment (\/\/[^\r\n]*[\r|\n|\r\n]?)



%%

"int" { return INT; }
"byte" { return BYTE; }
"b" { return B; }
"bool" { return BOOL; }
"and" { return AND; }
"or" { return OR; }
"not" { return NOT; }
"true" { return TRUE; }
"false" { return FALSE; }
"return" { return RETURN; }
"if" { return IF; }
"else" { return ELSE; }
"while" { return WHILE; }
"break" { return BREAK; }
"continue" { return CONTINUE; }
";" { return SC; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"=" { return ASSIGN; }
{binop} { return BINOP; }
{relop} { return RELOP;}
{comment} {}
{whitespace} {}
{id} {return ID; }
{number} {return NUM; }
{string} { return STRING; }
. {error();}



%%

void error(){
      output::errorLex(yylineno);
      exit(0);
}

