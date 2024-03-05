// Exercise 4. Write a function max that returns the larger of two given integer parameters. Write a test method using an assert that checks that your function is correct.
function max(a: int, b: int): int 
{
	if a < b then b else a
}

method Testing() {
	assert max(1, 2) == 2;
    assert max(3 , 4) == 4;
    assert max(6, 9) == 9;
}
