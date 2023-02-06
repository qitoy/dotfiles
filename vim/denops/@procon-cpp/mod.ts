import { ModuleType } from "../procon/types.ts";

export const Module: ModuleType = {
    templates: {"main.cpp": String.raw`/*{{{ begin template */
#include <bits/stdc++.h>
using namespace std; using ll = long long;
template <class T> inline bool chmin(T &a, T b) { if (a > b) { a = b; return true; } return false; }
template <class T> inline bool chmax(T &a, T b) { if (a < b) { a = b; return true; } return false; }
template <class T> istream &operator>>(istream &is, vector<T> &vec) { for (auto&& v : vec) is >> v; return is; }
void Main(); int main() { cin.tie(nullptr); ios_base::sync_with_stdio(false); cout << fixed << setprecision(10); Main(); }
/*}}} end template */

void Main() {



}`},
    compilePre: (sourcePath: string) => Promise.resolve(""),
    submitPre: (sourcePath: string) => Promise.resolve(""),

};
