function More(x: int): int {
  if x <= 0 then 1 else More(x - 2) + 3
}

lemma {:induction false} Increasing(x: int)
  ensures x < More(x)
{/* TODO */ }

method ExampleLemmaUse(a: int) {/* TODO */ }

// Ex 5.0
method ExampleLemmaUse50(a: int) {/* TODO */ }

// Ex 5.1
method ExampleLemmaUse51(a: int) {/* TODO */ }

// Ex 5.6
function Ack(m: nat, n: nat): nat {
  if m == 0 then
    n + 1
  else if n == 0 then
    Ack(m - 1, 1)
  else
    Ack(m - 1, Ack(m, n - 1))
}

lemma {:induction false} Ack1n(m: nat, n: nat)
  requires m == 1
  ensures Ack(m, n) == n + 2
{/* TODO */ }

// Ex 5.5
function Reduce(m: nat, x: int): int {
  if m == 0 then x else Reduce(m / 2, x + 1) - m
}

lemma {:induction false} ReduceUpperBound(m: nat, x: int)
  ensures Reduce(m, x) <= x
{/* TODO */ }

// 5.5.1
lemma {:induction false} ReduceLowerBound(m: nat, x: int)
  ensures x - 2 * m <= Reduce(m, x)
{/* TODO */ }


// ------------------------------------------------------------------------------
// ----- Expr Eval --------------------------------------------------------------
// ------------------------------------------------------------------------------

// 5.8.0

datatype Expr = Const(nat)
              | Var(string)
              | Node(op: Op, args: List<Expr>)

datatype Op = Mul | Add
datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function Eval(e: Expr, env: map<string, nat>): nat
{
  match e {
    case Const(c) => c
    case Var(s) => if s in env then env[s] else 0
    case Node(op, args) => EvalList(op, args, env)
  }
}

// intro'd in 5.8.1
function Unit(op: Op): nat {
  match op case Add => 0 case Mul => 1
}

function EvalList(op: Op, args: List<Expr>, env: map<string, nat>): nat
  decreases args, op, env
{
  match args {
    case Nil => Unit(op)
    case Cons(e, tail) =>
      var v0, v1 := Eval(e, env), EvalList(op, tail, env);
      match op
      case Add => v0 + v1
      case Mul => v0 * v1
  }
}

function Substitute(e: Expr, n: string, c: nat): Expr
{
  match e
  case Const(_) => e
  case Var(s) => if s == n then Const(c) else e
  case Node(op, args) => Node(op, SubstituteList(args, n, c))
}

function SubstituteList(es: List<Expr>, n: string, c: nat): List<Expr>
{
  match es
  case Nil => Nil
  case Cons(head, tail) => Cons(Substitute(head, n, c), SubstituteList(tail, n, c))
}

lemma {:induction false} EvalSubstituteCorrect(e: Expr, n: string, c: nat, env: map<string, nat>)
  ensures Eval(Substitute(e, n, c), env) == Eval(e, env[n := c])
{/* TODO */ }

lemma {:induction false} EvalSubstituteListCorrect(op: Op, args: List<Expr>, n: string, c: nat, env: map<string, nat>)
  ensures EvalList(op, SubstituteList(args, n, c), env) == EvalList(op, args, env[n := c])
  decreases args, op, n, c, env
{/* TODO */ }

// Ex 5.16
lemma EvalEnv(e: Expr, n: string, env: map<string, nat>)
  requires n in env.Keys
  ensures Eval(e, env) == Eval(Substitute(e, n, env[n]), env)
{/* TODO */ }

lemma EvalEnvList(op: Op, es: List<Expr>, n: string, env: map<string, nat>)
  decreases es, op, n, env
  requires n in env.Keys
  ensures EvalList(op, es, env) == EvalList(op, SubstituteList(es, n, env[n]), env)
{/* TODO */ }

// Ex 5.17
lemma EvalEnvDefault(e: Expr, n: string, env: map<string, nat>)
  requires n !in env.Keys
  ensures Eval(e, env) == Eval(Substitute(e, n, 0), env)
{/* TODO */ }

lemma EvalEnvDefaultList(op: Op, args: List<Expr>, n: string, env: map<string, nat>)
  decreases args, op, n, env
  requires n !in env.Keys
  ensures EvalList(op, args, env) == EvalList(op, SubstituteList(args, n, 0), env)
{/* TODO */ }

// Ex 5.18
lemma SubstituteIdempotent(e: Expr, n: string, c: nat)
  ensures Substitute(Substitute(e, n, c), n, c) == Substitute(e, n, c)
{/* TODO */ }

lemma SubstituteListIdempotent(args: List<Expr>, n: string, c: nat)
  ensures SubstituteList(SubstituteList(args, n, c), n, c) == SubstituteList(args, n, c)
{/* TODO */ }

// 5.8.1
// Optimization is correct

function Optimize(e: Expr): Expr
  // intrinsic
  // ensures forall env: map<string, nat> :: Eval(Optimize(e), env) == Eval(e, env)
{
  if e.Node? then
    var args := OptimizeAndFilter(e.args, Unit(e.op));
    Shorten(e.op, args)
  else
    e
}

lemma OptimizeCorrect(e: Expr, env: map<string, nat>)
  ensures Eval(Optimize(e), env) == Eval(e, env)
{/* TODO */ }

function OptimizeAndFilter(args: List<Expr>, u: nat): List<Expr>
  // intrinsic
  // ensures forall op: Op, env: map<string, nat> :: u == Unit(op) ==> Eval(Node(op, OptimizeAndFilter(args, u)), env) == Eval(Node(op, args), env)
{
  match args
  case Nil => Nil
  case Cons(head, tail) =>
    var hd, tl := Optimize(head), OptimizeAndF/* TODO */ }

lemma OptimizeAndFilterCorrect(args: List<Expr>, op: Op, env: map<string, nat>)
  ensures Eval(Node(op, OptimizeAndFilter(args, Unit(op))), env) == Eval(Node(op, args), env)
{/* TODO */ }

lemma EvalListUnitHead(head: Expr, tail: List<Expr>, op: Op, env: map<string, nat>)
  ensures Eval(head, env) == Unit(op) ==> EvalList(op, Cons(head, tail), env) == EvalList(op, tail, env)
{/* TODO */ }

function Shorten(op: Op, args: List<Expr>): Expr {
  match args
  case Nil => Const(Unit(op))
  // shorten the singleton list
  case Cons(head, Nil) => head
  // reduce units from the head
  case _ => Node(op, args)
}

lemma ShortenCorrect(args: List<Expr>, op: Op, env: map<string, nat>)
  ensures Eval(Shorten(op, args), env) == Eval(Node(op, args), env)
{/* TODO */ }
