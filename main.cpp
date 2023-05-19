#include <fstream>
#include <iostream>
#include "KnowledgeBase.h"

int main () {
    ifstream fi("1.2.pl");

    KnowledgeBase KB;

    while (!fi.eof()) {
        string Sentence;
        getline(fi, Sentence);
        KB.declare(Sentence);
    }

    fi.close();
    vector<Rule>::iterator it = KB.m_Rule.begin();
    cout << it->m_LHS;
    //fi.open("1.2-query.txt");

    // while (!fi.eof()) {
    //     Fact F;
    //     string Sentence;
    //     getline(fi, Sentence);
    //     F = Sentence;
    //     if (!(KB.m_Fact[0] == F).compare("True"))
    //         cout << "1";
    // }
    
    //fi.close();
    return 0;
}