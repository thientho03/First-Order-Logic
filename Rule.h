#ifndef RULE_H
#define RULE_H

#include "Fact.h"

class Rule {
public:
    vector<Fact> m_RHS;
    Fact m_LHS;

public:
    Rule &operator=(const string &);
    friend ostream &operator<<(ostream &os, const Rule &);
};

#endif