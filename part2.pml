#define N 4

int process = -1;
bool print[N];

init {
  atomic {
    print[0] = true;
    process = 0;
  }
}

active [N]proctype p() {
  do
  :: process == (_pid - 1) -> print[_pid - 1] = true;
                        printf("This is print: %d\n", _pid - 1);
                        print[_pid - 1] = false;
                        if
                        ::process == (N - 1) -> process = 0;
                        ::process = (process % N) + 1;
                        fi;
  :: else -> skip;
  od
}