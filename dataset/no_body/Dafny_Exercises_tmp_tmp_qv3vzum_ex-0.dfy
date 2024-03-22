// Exercise 0. Write a method Max that takes two integer parameters and returns their maximum. Add appropriate annotations and make sure your code verifies.
method Max(a:int, b:int) returns(c:int)
    //pre-condition
    ensures a < b ==> c == b
    ensures b <= a ==> c == a
{/* TODO */ } 

