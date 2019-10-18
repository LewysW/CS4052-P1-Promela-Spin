//Boolean state variables
bool s1 = false;
bool s2 = false;
bool s3 = false;

//Current process to run
byte x = 1;

//Each process Pi running their critical section
//when x = i and all other variables are false
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

//Asserts that ensure that x is in the correct range,
//and no invalid combination of states can be true together
never {
  do
  :: assert(!(s1 && s2));
  :: assert(!(s1 && s3));
  :: assert(!(s2 && s3));
  :: assert(x >= 1);
  :: assert(x <= 3);
  :: assert(!(x == 1 && s2));
  :: assert(!(x == 3 && s1));
  :: assert(!(x == 2 && s3));
  od;
}
