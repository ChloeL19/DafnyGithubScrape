/**
Consider cellular automata: a row of cells is repeatedly updated according to a rule. In this exercise I dabbled with,
each cell has the value either false or true. Each cell's next state depends only on the immediate neighbours, in the 
case where the cell is at the edges of the row, the inexistent neighbours are replaced by "false". The automaton table 
will contain the initial row, plus a row for each number of steps.
 */
class Automaton {

/**
This method computes the automaton.
Provide the initial row: init, the rule and the desired number of steps
 */
method ExecuteAutomaton(init: seq<bool>, rule: (bool, bool, bool) -> bool, steps: nat)
  returns (table: seq<seq<bool>>)
  // we need the initial row to have the length bigger or equal to two
{
  // the table containing the automaton 
  var result : seq<seq<bool>> := [init];
  // the current row
  var currentSeq := init;
  var index := 0;

  while index < steps
  {
    var index2 := 1;
    // the next row to be computed
    var nextSeq := [];
    nextSeq := nextSeq + [rule(false, currentSeq[0], currentSeq[1])];

    while index2 < |currentSeq| - 1
    {
      nextSeq := nextSeq + [rule(currentSeq[index2 - 1], currentSeq[index2], currentSeq[index2 + 1])];
      index2 := index2 + 1;
    }
    nextSeq := nextSeq + [rule(currentSeq[|currentSeq| - 2], currentSeq[|currentSeq| - 1], false)];

    currentSeq := nextSeq;
    result := result + [nextSeq];
    index := index + 1;
  }

  return result;
}

// example rule
function TheRule(a: bool, b: bool, c: bool) : bool
{
  a || b || c
}

// example rule 2
function TheRule2(a: bool, b: bool, c: bool) : bool
{
  a && b && c
}

method testMethod() {
  // the initial row
  var init := [false, false, true, false, false];

  // calculate automaton steps with 
  var result := ExecuteAutomaton(init, TheRule, 3);
  // the intial row plus the three steps of the automaton are showed bellow
  var result2 := ExecuteAutomaton(init, TheRule2, 2);
  // the intial row plus the two steps of the automaton are showed bellow
}
}


