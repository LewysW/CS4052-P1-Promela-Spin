#define N 20

bool print[N];

init {
  int i;
  for (i : 1 .. N) {
    run p(i);
  }
}

proctype p(int id) {
  printf("%d\n", id);
}