method boundedIncrement() {
method boundedIncrement() {
  var v := 0;
  while (v < 100)
    invariant 0 <= v <= 100
    decreases 100 - v
  {
    v := v + 1;
  }
}
