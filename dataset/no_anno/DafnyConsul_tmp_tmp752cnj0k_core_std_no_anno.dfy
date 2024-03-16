module def.std {

  datatype Option<+T> = Some(value: T) | None {
    predicate IsFailure() {
      None?
    }

    function PropagateFailure<U>(): Option<U>
    {
      None
    }

    function Extract(): T
    }

    function UnwrapOr(default: T): T {
      match this
      case Some(v) => v
      case None() => default
    }
  }

  datatype Result<+T, +E> = Ok(value: T) | Err(error: E) {
    predicate IsFailure() {
      Err?
    }

    function PropagateFailure<U>(): Result<U, E>
    {
      Err(error)
    }

    function Extract(): T
    {
      value
    }

    function Map<U>(f: T -> U): Result<U, E>
    {
      if Ok? then Ok(f(value)) else PropagateFailure()
    }

    function MapErr<F>(f: E -> F): Result<T, F>
    {
      if Ok? then Ok(value) else Err(f(error))
    }
  }
}

