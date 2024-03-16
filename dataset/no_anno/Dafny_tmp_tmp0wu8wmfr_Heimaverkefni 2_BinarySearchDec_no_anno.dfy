// Author of question: Snorri Agnarsson
// Permalink of question: https://rise4fun.com/Dafny/CGB1z

// Authors of solution:   Alexander Guðmundsson
// Permalink of solution: https://rise4fun.com/Dafny/VnB5

// Use the command
//   dafny H2-skeleton.dfy
// or
//   compile H2-skeleton.dfy
// to compile the file.
// Or use the web page rise4fun.com/dafny.

// When you have solved the problem put
// the solution on the Dafny web page,
// generate a permalink and put it in
// this file.

method SearchRecursive( a: seq<real>, i: int, j: int, x: real ) returns ( k: int )
{
    if i == j
    {
        return i;
    }
    var m := i + (j-i)/2;
    if a[m] < x
    {
        k := SearchRecursive(a,i,m,x);
    }
    else
    {
        k := SearchRecursive(a,m+1,j,x);
    }
}

method SearchLoop( a: seq<real>, i: int, j: int, x: real ) returns ( k: int )
{
    if i == j
    {
        return i;
    }
    var p := i;
    var q := j;
    while p != q
    {
        var m := p + (q-p)/2;
        if a[m] < x
        {
            q := m;
        }
        else
        {
            p := m+1;
        }
    }
    return p;
}

// Ef eftirfarandi fall er ekki samþykkt þá eru
// föllin ekki að haga sér rétt að mati Dafny.
method Test( a: seq<real>, x: real )
{

    var k1 := SearchLoop(a,0,|a|,x);
    var k2 := SearchRecursive(a,0,|a|,x);
}
