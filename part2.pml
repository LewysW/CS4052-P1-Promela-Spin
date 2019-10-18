//Test value of N
#define N 4

//Current process allowed to print
int process = 0;

//List of boolean values signalling who is printing
bool print[N];

//Creates N processes
active [N]proctype p() {
  //Assigns the processes id
  int id = _pid;
  
  //Checks if the current process is allowed to print
  //then sets its print value to true (printing),
  //prints its id and then sets its print value to false,
  //then hands over control to the next process to print
  do
  :: process == id ->   print[id] = true;
                        printf("This is print: %d\n", id);
                        print[id] = false;
                        if
                        ::process == (N - 1) 
                          -> process = 0;
                        ::process >= 0 && process < (N - 1) 
                          -> process++;
                        fi;
  :: else -> skip;
  od;
}

//Ensures that process is in the correct range
//and that 0 or 1 values in the print list are 
//true at any one time
never {
  do
  :: assert(process >= 0);
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