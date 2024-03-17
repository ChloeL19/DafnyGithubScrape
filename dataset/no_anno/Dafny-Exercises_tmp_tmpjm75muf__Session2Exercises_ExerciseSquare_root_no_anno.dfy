method mroot1(n:int) returns (r:int) //Cost O(root n)
{
    r:=0;
	while (r+1)*(r+1) <=n
	 {
	   r:=r+1;
	 }


}


method mroot2(n:int) returns (r:int) //Cost O(n)
{
    r:=n;
	while n<r*r
	{
		r:=r-1;
	}


}

method mroot3(n:int) returns (r:int) //Cost O(log n)
{   var y:int;
    var h:int;
    r:=0;
	y:=n+1;
	//Search in interval [0,n+1) 
	while (y!=r+1) //[r,y]
	 {
	   h:=(r+y)/2;
	   if (h*h<=n)
	     {r:=h;}
	   else
	     {y:=h;} 
	 }


}

