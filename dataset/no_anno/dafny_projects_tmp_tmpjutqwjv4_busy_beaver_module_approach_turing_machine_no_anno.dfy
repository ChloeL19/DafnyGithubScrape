
abstract module TuringMachineInterface {
  type State
  type Symbol
  type TM

  datatype StateOrHalt = RunState(state : State) | Halt

  datatype Dir = Right | Left
  datatype Transition =
    Transition(symbol : Symbol, state : StateOrHalt, dir : Dir)
  
  function LookupTrans(
    tm : TM, state : State, symbol : Symbol) : Transition
  
  function InitSymbol(tm : TM) : Symbol
  function InitState(tm : TM) : State
}
