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
ltl a {<>(x != 10)}

//It is possible that from a certain point onwards x is always odd
//Prove the opposite: 
//say that x is never eventually always odd and if it fails then the opposite must be true
ltl b {!(<>[](x % 2 == 1))}

//It is possible that from a certain point onwards x is infinitely often odd
//Prove the opposite: 
//say that x is never infinitely often odd and if it fails then at least one case of the opposite must be true
ltl c {!(<>[]<>(x % 2 == 1))}

//It is always true that y <= x
ltl d {[](y <= x)}

//It is always true that when y != x it follows that at some point y = x
ltl e {[]((y != x) -> <>(y == x))}

