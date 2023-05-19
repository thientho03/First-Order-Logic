#ifndef FACT_H
#define FACT_H

#include <string>
#include <vector>
#include <iostream>
using namespace std;

class Fact {
private:
    string m_op;
    vector<string> m_argv;

public:
    friend ostream &operator<<(ostream &os, const Fact &);
    Fact &operator=(const string &);
    string operator==(const Fact &);
};

#endif