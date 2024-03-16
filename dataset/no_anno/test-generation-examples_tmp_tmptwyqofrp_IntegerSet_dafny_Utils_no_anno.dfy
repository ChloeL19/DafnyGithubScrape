module Utils {
  class Assertions<T> {
    static method {:extern} assertEquals(expected : T, actual : T)
    static method {:extern} expectEquals(expected : T, actual : T)
    static method {:extern} assertTrue(condition : bool)
    static method {:extern} expectTrue(condition : bool)
    static method {:extern} assertFalse(condition : bool)
    static method {:extern} expectFalse(condition : bool)
  }
}
