byte x = 1;
byte y = 0;

active proctype P1(){
  do
  :: x = x + 2;
  od;
}

active proctype P2(){
  do
  :: x = x + 1;
  od;
}

active proctype P3(){
  do
  :: y < x -> y = x;
  od;
}

//x is eventually not 10
ltl a {eventually x != 10}

//It is possible that from a certain point onwards x is always odd
ltl b {!always (eventually always (x % 2 == 1))}

//It is possible that from a certain point onwards x is infinitely often odd
ltl c {!always (always eventually (x % 2 == 1))}

//It is always true that y <= x
ltl d {always y <= x}

//It is always true that when y != x it follows that at some point y = x
ltl e {always y != x implies eventually y == x}

