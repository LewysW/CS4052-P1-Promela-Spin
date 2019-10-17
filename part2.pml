#define N 4

int process = 0;
bool print[N];

active [N]proctype p() {
  int id = _pid;
  do
  :: process == id ->   print[id] = true;
                        printf("This is print: %d\n", id);
                        print[id] = false;
                        if
                        ::process == (N - 1) 
                          -> process = 0;
                        ::process >= 0 && process < (N - 1) 
                          -> process = (process % N) + 1;
                        fi;
  :: else -> skip;
  od;
}

never {
  do
  :: assert(process >= -1);
  :: assert(process < N);
  :: atomic {
      int isTrue = 0;
      int i;
      for (i : 0 .. (N - 1)) {
      if
      :: print[i] -> isTrue++;
      fi;
      }
      assert(isTrue == 0 || isTrue == 1);
    }
  od;
}