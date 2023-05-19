#ifndef KNOWLEDGEBASE_H
#define KNOWLEDGEBASE_H

#include <queue>
#include <string>
#include "Fact.h"
#include "Rule.h"

using namespace std;

class KnowledgeBase {
public:
    vector<Fact> m_Fact;
    vector<Rule> m_Rule;

public:
    void declare(string);
};



#endif