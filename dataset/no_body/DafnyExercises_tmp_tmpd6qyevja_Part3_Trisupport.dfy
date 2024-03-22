// Do not submit or modify this file
class Trisupport {
 constructor() 
 ensures printed() == 0
 ensures row() == 1
 ensures col() == 0
 {test_printed := 0; test_col :=0; test_row :=1; }

 var test_printed : nat;
 var test_row : nat;
 var test_col : nat;

 function    printed() : (r : nat)  reads this`test_printed {test_printed}
 function    row() : (r : nat) reads this`test_row {test_row}
 function    col() : (r : nat) reads this`test_col {test_col}
 
 method star() 
   ensures test_printed == old(test_printed) + 1
   ensures test_col == old(test_col + 1)
   modifies this`test_printed, this`test_col
   {/* TODO */ }

 method space()
  {/* TODO */ }

 method cr() 
  //oracle will have additional "requires" clauses
  modifies this`test_row, this`test_col
  ensures test_row == old(test_row) + 1
  ensures test_col == 0
  {/* TODO */ }

}
