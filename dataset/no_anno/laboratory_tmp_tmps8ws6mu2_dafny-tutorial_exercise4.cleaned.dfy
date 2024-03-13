function max(a: int, b: int): int
{
    // Fill in an expression here.
    if a < b then b else a
}

method Testing() {
method Testing() {
    // Add assertions to check max here.
    assert max(1, 2) == 2;
    assert max(10, 10) == 10;
    assert max(-10, -12) == -10;
}
