#include "Fact.h"
#include "Utils.h"

Fact &Fact::operator=(const string &Sentence) {
    auto tokens = Utils::String::split(Sentence, "(");
    m_op = tokens[0];
    tokens = Utils::String::split(tokens[1], ")");
    m_argv = Utils::String::split(tokens[0], ", ");

    return *this;
}

ostream &operator<<(ostream &os, const Fact &fact) {
    os << fact.m_op << '(';
    for (int i = 0; i < fact.m_argv.size(); i++) {
        os << fact.m_argv[i];
        if (i < fact.m_argv.size() - 1)
            os << ", ";
        else 
            os << ").";
    }
        
    return os;
}

string Fact::operator==(const Fact &fact) {
    if (m_op != fact.m_op || m_argv.size() != fact.m_argv.size())
        return "False";
    
    
    return "False";
}