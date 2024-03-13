function max(a: int, b: int): int
{
  if a>=b then a else b // Use your code from Exercise 4
}
method Testing() returns (r: int) {
method Testing() returns (r: int) {
  // Add assertions to check max here. Be sure to capture it to the out-parameter
  r := max(2,3);
  assert r == 3;
}
