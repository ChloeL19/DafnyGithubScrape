class Process {
    var row: nat;
    var curColumn: nat;
    var opsLeft: nat;

    constructor (init_row: nat, initOpsLeft: nat) 
    {
        row := init_row;
        curColumn := 0;
        opsLeft := initOpsLeft;
    }
}

function sum(s : seq<nat>) : nat
{
    if s == [] then 0 else s[0] + sum(s[1..])
}

lemma sum0(s : seq<nat>)
  {
    if s == [] {
    } else {
      sum0(s[1..]);
    }
  }

lemma sum_const(s : seq<nat>, x : nat)
  {
  }

lemma sum_eq(s1 : seq<nat>, s2 : seq<nat>)
  {

  }

lemma sum_exept(s1 : seq<nat>, s2 : seq<nat>, x : nat, j : nat)
{
    if s1 == [] {
    } else {
        if j == 0 {
            sum_eq(s1[1..], s2[1..]);
        } else {
            sum_exept(s1[1..], s2[1..], x, j - 1);
        }
    }
}


function calcRow(M : array2<int>, x : seq<int>, row: nat, start_index: nat) : (product: int)
{
    if start_index == M.Length1 then
        0
    else
        M[row, start_index] * x[start_index] + calcRow(M, x, row, start_index+1)
}

class MatrixVectorMultiplier
{   

    ghost predicate Valid(M: array2<int>, x: seq<int>, y: array<int>, P: set<Process>, leftOvers : array<nat>)
    {
        M.Length0 == y.Length &&
        M.Length1 == |x| &&
        |P| == y.Length &&
        |P| == leftOvers.Length &&

        (forall p, q :: p in P && q in P && p != q ==> p.row != q.row) &&
        (forall p, q :: p in P && q in P ==> p != q) &&
        (forall p :: p in P ==> 0 <= p.row < |P|) &&
        (forall p :: p in P ==> 0 <= p.curColumn <= M.Length1) &&
        (forall p :: p in P ==> 0 <= p.opsLeft <= M.Length1) && 
        (forall p :: p in P ==> y[p.row] + calcRow(M, x, p.row, p.curColumn) == calcRow(M, x, p.row, 0)) &&
        (forall p :: p in P ==> leftOvers[p.row] == p.opsLeft) &&
        (forall p :: p in P ==> p.opsLeft == M.Length1 - p.curColumn) &&
        (sum(leftOvers[..]) > 0 ==> exists p :: p in P && p.opsLeft > 0)
    }


    constructor (processes: set<Process>, M_: array2<int>, x_: seq<int>, y_: array<int>, leftOvers : array<nat>)
        // Idea here is that we already have a set of processes such that each one is assigned one row.
        // Daphny makes it a ginormous pain in the ass to actually create such a set, so we just assume
        // we already have one.

        //this states that the number of rows and processes are the same, and that there is one process
        //for every row, and that no two processes are the same, nor do any two processes share the same
        //row
    {
        
    }

    method processNext(M: array2<int>, x: seq<int>, y: array<int>, P : set<Process>, leftOvers : array<nat>)
    {
        var p :| p in P && p.opsLeft > 0;
        y[p.row] := y[p.row] + M[p.row, p.curColumn] * x[p.curColumn];
        p.opsLeft := p.opsLeft - 1;
        p.curColumn := p.curColumn + 1;
        leftOvers[p.row] := leftOvers[p.row] - 1;
        sum_exept(old(leftOvers[..]), leftOvers[..], 1, p.row);
    }


}

method Run(processes: set<Process>, M: array2<int>, x: array<int>) returns (y: array<int>)
{
    var i := 0;
    y := new int[M.Length0](i => 0);

    var leftOvers := new nat[M.Length0](i => M.Length1);

    var mv := new MatrixVectorMultiplier(processes, M, x[..], y, leftOvers);
    while sum(leftOvers[..]) > 0 && exists p :: (p in processes && p.opsLeft > 0)
    {
        mv.processNext(M, x[..], y, processes, leftOvers);
    }
}


// lemma lemma_newProcessNotInSet(process: Process, processes: set<Process>)
//     requires (forall p :: p in processes ==> p.row != process.row)
//     ensures process !in processes
// {
// }

// lemma diffRowMeansDiffProcess(p1: Process, p2: Process)
//     requires p1.row != p2.row
//     ensures p1 != p2
// {
// }


// method createSetProcesses(numRows: nat, numColumns: nat) returns (processes: set<Process>)
//     ensures |processes| == numRows
//     ensures (forall p, q :: p in processes && q in processes ==> p != q)
//     ensures (forall p, q :: p in processes && q in processes && p != q ==> p.row != q.row)
//     ensures (forall p :: p in processes ==> 0 <= p.row < numRows)
//     ensures (forall p :: p in processes ==> 0 == p.curColumn)
//     ensures (forall p :: p in processes ==> p.opsLeft == numColumns)
// {
//     processes := {};
//     assert (forall p, q :: p in processes && q in processes ==> p != q);
//     assert (forall p, q :: p in processes && q in processes && p != q ==> p.row != q.row);
//     var i := 0;
//     while i < numRows
//         invariant i == |processes|
//         invariant 0 <= i <= numRows
//         invariant (forall p, q :: p in processes && q in processes && p != q ==> p.row != q.row)
//         invariant (forall p, q :: p in processes && q in processes ==> p != q)
//     {
//         var process := new Process(i, numColumns);
//         processes := processes + {process};
//         i := i + 1;
//     }
// }

// method Main()
// {
//     var M: array2<int> := new int[3, 3];

//     M[0,0] := 1;
//     M[0,1] := 2;
//     M[0,2] := 3;

//     M[1,0] := 1;
//     M[1,1] := 2;
//     M[1,2] := 3;

//     M[2,0] := 1;
//     M[2,1] := 20;
//     M[2,2] := 3;

//     var x := new int[3];
//     x[0] := 1;
//     x[1] := -3;
//     x[2] := 3;

//     var p0: Process := new Process(0, 3);
//     var p1: Process := new Process(1, 3);
//     var p2: Process := new Process(2, 3);
//     var processes := {p0, p1, p2};

//     assert (p0 != p1 && p1 != p2 && p0 != p2);
//     assert (forall p :: p in processes ==> p == p0 || p == p1 || p == p2);
//     assert (exists p :: p in processes && p == p0);
//     assert (exists p :: p in processes && p == p1);
//     assert (exists p :: p in processes && p == p2);
//     assert (forall p, q :: p in processes && q in processes ==> p.row != q.row);
//     assert (forall p, q :: p in processes && q in processes ==> p != q);

//     var y := Run(processes, M, x);

//     for i := 0 to 3 {
//         print "output: ", y[i], "\n";
//     }
// }

