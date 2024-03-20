// Do not submit or modify this file
class Trisupport {
 constructor() 
 {test_printed := 0; test_col :=0; test_row :=1; }

 var test_printed : nat;
 var test_row : nat;
 var test_col : nat;

 function    printed() : (r : nat)  reads this`test_printed {test_printed}
 function    row() : (r : nat) reads this`test_row {test_row}
 function    col() : (r : nat) reads this`test_col {test_col}
 
 method star() 
   {test_printed := test_printed + 1; test_col := test_col + 1; print "* ";}

 method space()
  { print " ";}

 method cr() 
  //oracle will have additional "requires" clauses
  modifies this`test_row, this`test_col
  {
   print "row=", test_row, " printed=", test_printed, "\n";
   test_row := test_row + 1; test_col := 0;  }

}
