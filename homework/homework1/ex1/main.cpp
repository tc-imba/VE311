//
// Created by liu on 17-5-24.
//

#include <gmp.h>
#include <gmpxx.h>
#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;

int main() {

    mpz_class k = 0;
    mpq_class a = 1, b = 0, sum = 0;

    mpq_class ep(1, 10);
    for (int i = 0; i < 4; i++) {
        ep = (ep * ep * ep * ep * ep * ep * ep * ep * ep * ep);
    }
    ep /= 10;

    mpq_class temp;
    do {
        temp = a * (4. / (b + 1.) - 2. / (b + 4.) - 1. / (b + 5.) - 1. / (b + 6.));
        sum += temp;
        //cout << mpf_class(temp, 10000) << endl;
        b += 8;
        a /= 16;
    } while (temp > ep);

    mpf_class num(sum.get_num(), 40000);
    mpf_class den(sum.get_den(), 40000);
    mpf_class pi(num / den);
    cout << setprecision(10001) << pi << endl;

    ofstream out("pi.txt");
    out << setprecision(10001) << pi << endl;
    out.close();

    sum = k = temp = 1;
    do {
        temp /= k++;
        sum += temp;
    } while (temp > ep);

    num = sum.get_num();
    den = sum.get_den();
    mpf_class e = mpf_class(num / den);
    cout << setprecision(10001) << e << endl;

    out.open("e.txt");
    out << setprecision(10001) << e << endl;
    out.close();
}