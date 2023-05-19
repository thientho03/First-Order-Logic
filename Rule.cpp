#include "Rule.h"
#include "Utils.h"

Rule &Rule::operator=(const string &Sentence) {
    auto tokens = Utils::String::split(Sentence, ":- ");
    m_LHS = tokens[0];
    tokens = Utils::String::split(tokens[1], "),");
    for (auto token : tokens) {
        Fact fact;

        token += ")";
        fact = token;
        m_RHS.push_back(fact);
    }

    return *this;
}

ostream &operator<<(ostream &os, const Rule &rule) {
    os << rule.m_LHS << " :- ";
    for (int i = 0; i < rule.m_RHS.size(); i++) {
        os << rule.m_RHS[i];
    }
    return os;
}