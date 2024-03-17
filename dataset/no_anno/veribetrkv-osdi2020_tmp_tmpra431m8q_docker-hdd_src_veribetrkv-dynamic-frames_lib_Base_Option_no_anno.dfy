module {:extern} Options {
  datatype Option<V> = None | Some(value:V)

  function MapOption<V0, V1>(opt: Option<V0>, f: V0 ~> V1) : (result: Option<V1>)
  {
    match opt {
      case Some(v) => Some(f(v))
      case None => None
    }
  }

  function FlatMapOption<V0, V1>(opt: Option<V0>, f: V0 ~> Option<V1>) : (result: Option<V1>)
  {
    match opt {
      case Some(v) => f(v)
      case None => None
    }
  }
} // module

