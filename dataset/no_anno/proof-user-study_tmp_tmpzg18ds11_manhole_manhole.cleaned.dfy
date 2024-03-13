module Manhole {

datatype Walker = W(x:int, y:int)
datatype State = S(w:Walker, radius:int)

predicate Init(s:State) {
predicate Init(s:State) {
    && s.w.x == 0 
    && s.w.y == 5
    && s.radius == 3
}

predicate MoveNorth(s:State, s':State) {
predicate MoveNorth(s:State, s':State) {
    && s'.w.x == s.w.x
    && s'.w.y == s.w.y + 1
    && s'.radius == s.radius
}

predicate MoveSouthEast(s:State, s':State) {
predicate MoveSouthEast(s:State, s':State) {
    && s'.w.x == s.w.x + 1
    && s'.w.y == s.w.y - 1
    && s'.radius == s.radius
}

predicate Next(s:State, s':State) {
predicate Next(s:State, s':State) {
    || MoveNorth(s, s')
    || MoveSouthEast(s, s')
}

predicate InManhole(s:State) {
predicate InManhole(s:State) {
    s.w.x * s.w.x + s.w.y*s.w.y <= s.radius * s.radius
}

predicate Safety(s:State) {
predicate Safety(s:State) {
    !InManhole(s)
}



}
