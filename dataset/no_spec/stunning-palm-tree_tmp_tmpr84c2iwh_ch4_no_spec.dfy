datatype Expr = Const(nat)
             | Var(string)
             | Node(op: Op, args: List<Expr>)

datatype Op = Mul | Add
datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function Eval(e: Expr, env: map<string, nat>): nat
{
  match e {
    case Const(c) => c
    // case Var(s) => if s in env then env[s] else 0
    // Ex 4.10
    case Var(s) => env[s]
    case Node(op, args) => EvalList(op, args, env)
  }
}

function EvalList(op: Op, args: List<Expr>, env: map<string, nat>): nat
{
  match args {
    case Nil => (match op case Add => 0 case Mul => 1)
    case Cons(e, tail) =>
      var v0, v1 := Eval(e, env), EvalList(op, tail, env);
      match op
      case Add => v0 + v1
      case Mul => v0 * v1
  }
}

// Ex 4.9
predicate GoodEnv(e: Expr, env: map<string, nat>) {
  match e
  case Const(_) => true
  case Var(s) => s in env
  case Node(_, args) => GoodEnvList(args, env)
}

predicate GoodEnvList(args: List<Expr>, env: map<string, nat>) {
  match args
  case Nil => true
  case Cons(head, tail) => GoodEnv(head, env) && GoodEnvList(tail, env)
}
