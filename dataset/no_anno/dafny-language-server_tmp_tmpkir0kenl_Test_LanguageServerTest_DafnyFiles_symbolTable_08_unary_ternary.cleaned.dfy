 method foo() returns (b:int) {
 method foo() returns (b:int) {
   b := 5;
    
   //negation expr
   b := -b; 
   
   //ite expr
   b := if b<0 then -b else b;

   //unary expr? wtf. how?
   b := b;
   
   //ternary expr? wtf. how?
   b := b;

}


