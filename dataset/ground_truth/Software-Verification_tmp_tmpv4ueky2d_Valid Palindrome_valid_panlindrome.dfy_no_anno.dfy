method isPalindrome(s: array<char>) returns (result: bool)
{
    var length := s.Length;

    var i := 0;
    while i < length / 2 
    {
        if s[i] != s[length - 1 - i]
        {
            return false;
        }

        i := i + 1;
    }

    return true;
}

