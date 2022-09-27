export const templateCpp = `/*{{{ begin template */
#include <bits/stdc++.h>
template <class T> inline bool chmin(T &a, T b) { if (a > b) { a = b; return true; } return false; }
template <class T> inline bool chmax(T &a, T b) { if (a < b) { a = b; return true; } return false; }
template <class T> std::istream &operator>>(std::istream &is, std::vector<T> &vec) { for (auto &v : vec) is >> v; return is; }
void Main(); int main() { std::cin.tie(nullptr); std::ios_base::sync_with_stdio(false); std::cout << std::fixed << std::setprecision(15); Main(); }
using namespace std; using ll = long long;
/*}}} end template */

void Main() {



}`
