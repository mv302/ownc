%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"//"[^\n]*    { /* Discard comments. */ }
[ \t\n]+      { /* Ignore whitespace */ }

"{"           { return OPEN_BRACE; }
"}"           { return CLOSE_BRACE; }
"("           { return '('; }
")"           { return ')'; }
";"           { return ';'; }
[0-9]+        {
                printf("yytext: %s\n", yytext);
                printf("yylval: %d\n", atoi(yytext));
                yylval=atoi(yytext); return NUMBER;
              }

"byebyebye"      { return RETURN; }

"int"         { return TYPE; }
"main"        { return IDENTIFIER; }

"#add_in"    { return INCLUDE; }
"<"[a-z.]+">" { return HEADER_NAME; }
%%
