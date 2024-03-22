module stack {
  datatype stack<T> = EmptyStack | stack(top: T, num_elems: nat, rest: stack<T>)
  datatype Option<T> = Some(elem: T) | None

  // TODO: Write pre and post conditions here
  method push<T>(stk: stack<T>, elem: T) returns (res: stack<T>)
    ensures res != EmptyStack
    ensures (stk == EmptyStack) ==> (res == stack(elem, 1, EmptyStack()))
  {
    match stk {
      case EmptyStack => {
        res := stack(elem, 1, EmptyStack());
      }

      case stack(top, num_elems, rest) => {
        res := stack(elem, num_elems + 1, stack(top, num_elems, rest));
      }
    }
  }

  method pop<T>(stk: stack<T>) returns (elem: Option<T>, res: stack<T>) {
    match stk {
      case EmptyStack => {
        elem := None();
        res := EmptyStack;
      }
      case stack(top, num_elems, rest) => {
        elem := Some(top);
        res := rest;
      }
    }
  }
}
