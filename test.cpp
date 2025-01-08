int global;

#define RET_VAL 0

#define MAX(a,b) ((a) > (b) ? (a) : (b))

#ifdef MYFILE
#define MYVAL 1
#else
#define MYVAL 0
#endif

// # 100 "other-file.cpp" 1 3 4
int main()
{
    int a;
    int d,e;
    return RET_VAL;
}
