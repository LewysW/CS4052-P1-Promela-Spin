bool s1 = false;
bool s2 = false;
bool s3 = false;

byte x = 1;

active proctype p1() {
  do
  ::atomic {
    x == 1 && !s1 && !s2 && !s3;
    s1 = true;
    x = 2;
  }
  s1 = false;
  od;
}

active proctype p2() {
  do
  ::atomic {
    x == 2 && !s1 && !s2 && !s3;
    s2 = true;
    x = 3;
  }
  s2 = false;
  od;
}

active proctype p3() {
  do
  ::atomic {
    x == 3 && !s1 && !s2 && !s3;
    s3 = true;
    x = 1;
  }

  s3 = false;
  od;
}

never {
  do
  :: assert(!(s1 && s2));
  :: assert(!(s1 && s3));
  :: assert(!(s2 && s3));
  :: assert(!(x == 1 && s2));
  :: assert(!(x == 3 && s1));
  :: assert(!(x == 2 && s3));
  od;
}
