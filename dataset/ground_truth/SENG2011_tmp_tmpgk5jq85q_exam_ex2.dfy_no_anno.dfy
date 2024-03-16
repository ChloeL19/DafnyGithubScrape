method Getmini(a:array<int>) returns(mini:nat) 
{
    // find mini
    var min:int := a[0];
    var i:int := 0;
    while i < a.Length
    {
        if a[i] < min {
            min := a[i];
        }
        i := i + 1;
    }

    //assert min in a[..]; // min is in a -> it will be found by this loop
    // find first occurance
    var k:int := 0;
    while k < a.Length 
    {
        if a[k] == min {
            return k;
        }
        k := k + 1;
    }
}

/*
method check() {
    var data := new int[][9,5,42,5,5]; // minimum 5 first at index 1
var mini := Getmini(data);
//print mini;
}
*/

