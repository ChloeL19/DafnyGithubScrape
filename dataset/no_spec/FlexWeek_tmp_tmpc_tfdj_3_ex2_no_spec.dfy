// 2. Given an array of positive and negative integers, it returns an array of the absolute value of all the integers. [-4,1,5,-2,-5]->[4,1,5,2,5]

function abs(a:int):nat
{
    if a < 0 then -a else a
}

method aba(a:array<int>)returns (b:array<int>)
{
    
    b := new int[a.Length];
    var i:=0;

    while(i < a.Length)
    {
        
        if(a[i] < 0){
            b[i] := -a[i];
        } else{
            b[i] := a[i];
        }
        i := i + 1;
    }
    

}


method Main()
{
  var a := new int[][1,-2,-2,1];
  var b := aba(a);
}
