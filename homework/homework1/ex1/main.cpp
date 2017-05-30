//
// Created by liu on 17-5-24.
//

#include <gmpxx.h>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>

using namespace std;

void output(const mpq_class &sum, const string &filename, const int width = 80, const int precision = 10000)
{
    mpf_class num(sum.get_num(), precision * 5);
    mpf_class den(sum.get_den(), precision * 5);
    mpf_class ans(num / den);
    stringstream ss;
    ss << setprecision(precision + 2) << ans << endl;
    ofstream out(filename);
    while (!ss.eof())
    {
        char c;
        ss >> c;
        out << c;
        if (c == '.')break;
    }
    out << " \\\\" << endl;
    while (!ss.eof())
    {
        string str;
        ss >> setw(width) >> str;
        if (str.length() <= 1)break;
        out << str << " \\\\" << endl;
    }
    out.close();
}

mpq_class generate_ep(int precision = 10000)
{
    mpq_class ep(1, 10), temp(1, 10);
    while (precision > 0)
    {
        if (precision % 2)ep *= temp;
        temp *= temp;
        precision /= 2;
    }
    return ep;
}

mpq_class calculate_pi(const mpq_class &ep)
{
    mpz_class k = 0;
    mpq_class a = 1, b = 0, sum = 0;
    mpq_class temp;
    do
    {
        temp = a * (4. / (b + 1.) - 2. / (b + 4.) - 1. / (b + 5.) - 1. / (b + 6.));
        sum += temp;
        b += 8;
        a /= 16;
    } while (temp > ep);
    return sum;
}

mpq_class calculate_e(const mpq_class &ep)
{
    mpq_class k = 1, sum = 1, temp = 1;
    do
    {
        temp /= k++;
        sum += temp;
    } while (temp > ep);
    return sum;
}

int main()
{
    mpq_class ep = generate_ep(10000);
    output(calculate_pi(ep), "pi.txt");
    output(calculate_e(ep), "e.txt");
}