#include "KnowledgeBase.h"
#include <iostream>

void KnowledgeBase::declare(string Sentence) {
    if (Sentence == "") 
        return;
    
    if (Sentence.find(":-") != string::npos) {
        Rule R;
        R = Sentence;
        m_Rule.push_back(R);
        return;
    }

    Fact F;
    F = Sentence;
    m_Fact.push_back(F);
}