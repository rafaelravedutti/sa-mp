#include <a_samp>

enum e_rule (<<= 1)
{
    rule0, //sem rules (exemplo parar deixarmos sem rules: rules &= rule0;
    rule1 = 1,
    rule2,
    rule3,
    rule4
}

new e_rule:rules = rule1 | rule3 | rule2; //cria a array rule com as rules 1 2 e 3

public OnFilterScriptInit()
{
    rules &= ~rule2; //tira uma rule
    rules |= rule4; //adiciona uma rule
    //verifica se uma rule está entre as rules
    if(rules & rule1)printf("Rule1");
    if(rules & rule2)printf("Rule2");
    if(rules & rule3)printf("Rule3");
    if(rules & rule4)printf("Rule4");
    //ou..:
    printf("\nRule1: %s\nRule2: %s\nRule3: %s\nRule4: %s\n",
    (rules & rule1) ? ("yes") : ("no"),
    (rules & rule2) ? ("yes") : ("no"),
    (rules & rule3) ? ("yes") : ("no"),
    (rules & rule4) ? ("yes") : ("no"));
    //como podemos ver, eu criei a array "rule" na linha 12 com as rules 1, 2 e 3;
    //depois tirei a rule 2 na linha 16;
    //e então adicionei a rule 4 na linha 17;
    //fizemos uma verificação se tal rule está entre as rules, e imprimimos se está ou não;
    //teremos o seguinte resultado: rule1, rule3 e rule4...
    return 1;
}
