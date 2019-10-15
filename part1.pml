bool s1 = false;
bool s2 = false;
bool s3 = false;

byte x = 1;

init {
  run p1();
  run p2();
  run p3();
}

proctype p1() {
  do
  ::atomic {
    x == 1 && !s2 && !s3;
    s1 = true;
    x = 2;
    s1 = false;
  }
  ::true
  od;
}

proctype p2() {
  do
  ::atomic {
    x == 2 && !s1 && !s3;
    s2 = true;
    x = 3;
    s2 = false;
  }
  ::true
  od;
}

proctype p3() {
  do
  ::atomic {
    x == 3 && !s1 && !s2;
    s3 = true;
    x = 1;
    s3 = false;
  }
  ::true
  od;
}