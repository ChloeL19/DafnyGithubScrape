


//Method barrier below receives an array and an integer p
//and returns a boolean b which is true if and only if 
//all the positions to the left of p and including also position p contain elements 
//that are strictly smaller than all the elements contained in the positions to the right of p 

//Examples:
// If v=[7,2,5,8] and p=0 or p=1 then the method must return false, 
// but for p=2 the method should return true
//1.Specify the method
//2.Implement an O(v.size()) method
//3.Verify the method

method barrier(v:array<int>,p:int) returns (b:bool)
//Give the precondition
//Give the postcondition
//{Implement and verify}
{
    var i:=1;
    var max:=0;
    
    while(i<=p)
    decreases p-i
    {
        if(v[i]>v[max]){
            max:=i;
        }
        
        i:=i+1;
    }

    while(i<v.Length && v[i]>v[max])
    decreases v.Length - i
    {
        i:=i+1;
    }
    b:=i==v.Length;
}
