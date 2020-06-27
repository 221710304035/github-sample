#include<stdio.h>
void main()
{
char str[20];
int state,i=1;
printf("Enter the string:");
gets(str);
if(isalpha(str[0]))
{
state=1;
}
else if(isdigit(str[0]))
{
state=2;
}
else
{
state=10;
}
while(str[i]!='\0')
{
switch(state)
{
case 1:if(isalpha(str[i])||isdigit(str[i]))
{
state=1;
}
else if(str[i]=='(')
{
state=3;
}
else if(str[i]=='[')
{
state=5;
}
else
{
state=10;
}
break;
case 2:if(isdigit(str[i]))
{
state=2;
}
else if(str[i]=='.'&&isdigit(str[i+1]))
{
state=4;
}
else
{
state=10;
}
break;
case 3:if(str[i]==')'&&str[i+1]=='\0')
{
state=6;
}
else if(isalpha(str[i])||str[i]==',')
state=3;
else
{
state=10;
}
break;
case 4:if(isdigit(str[i]))
{
state=4;
}
else
{
state=10;
}
break;
case 5:if(isdigit(str[i]))
{
state=5;
}
else if(str[i]==']'&&str[i+1]=='\0')
{
state=7;
}
else
{
state=10;
}
break;
}
i++;
if(state==10)
{
break;
}
}
printf("%s\n",str);
if(state==1)
{
printf("input is a variable");
}
else if(state==2)
{
printf("input is a integer constant");
}
else if(state==4)
{
printf("input is a real constant");
}
else if(state==6)
{
printf("input is a function");
}
else if(state==7)
{
printf("input is array");
}
else
{
printf("there is an array in the given expression");
}
}
