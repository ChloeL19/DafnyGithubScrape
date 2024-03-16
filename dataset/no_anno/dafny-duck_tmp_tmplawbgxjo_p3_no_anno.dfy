//Given an array of natural numbers, it returns the maximum value. [5,1,3,6,12,3]->12

method max(x:array<nat>) returns (y:nat) 
// for index loop problems
{
    
    y:= x[0];
    var i := 0;
    while(i < x.Length)
    {
        if(y <= x[i]){
            y := x[i];
        }

        i := i + 1;
    }
}

method Main()
{
    // when we did the other way it didnt work 
    var a:= new nat [6][5, 1, 3, 6, 12, 3];
    var c:= max(a);
   // print c;
    

}
