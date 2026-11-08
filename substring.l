%{ 
#include <stdio.h> 
#include <string.h> 
char old[] = "cat"; 
char newstr[] = "dog"; 
%} 
%% 
"cat"  
.|\n  
%% 
{ printf("dog"); } 
{ ECHO; } 
int yywrap() 
{ 
return 1; 
} 
int main() 
{ 
printf("Enter a string:\n"); 
yylex(); 
return 0; 
} 
