%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node
{
    char data[20];
    struct node *left;
    struct node *right;
} Node;

Node* createNode(char *data, Node *left, Node *right)
{
    Node *n = malloc(sizeof(Node));

    strcpy(n->data, data);
    n->left = left;
    n->right = right;

    return n;
}

void preorder(Node *root)
{
    if (root)
    {
        printf("%s ", root->data);
        preorder(root->left);
        preorder(root->right);
    }
}
%}

%union
{
    char *str;
    Node *node;
}

%token <str> ID
%type <node> E T F

%left '+'
%left '*'

%%

E:
      E '+' T
      {
          $$ = createNode("+", $1, $3);
      }
    | T
      {
          $$ = $1;
      }
    ;

T:
      T '*' F
      {
          $$ = createNode("*", $1, $3);
      }
    | F
      {
          $$ = $1;
      }
    ;

F:
      '(' E ')'
      {
          $$ = $2;
      }
    | ID
      {
          $$ = createNode($1, NULL, NULL);
      }
    ;

%%

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid expression\n");
    return 0;
}
