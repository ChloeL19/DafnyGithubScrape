module Split {
    function splitHelper(s: string, separator: string, index: nat, sindex: nat, results: seq<string>): seq<seq<char>>
    {
        if index >= |s| then results + [s[sindex..index]]
        else if |separator| == 0 && index == |s|-1 then splitHelper(s, separator, index+1, index, results)
        else if |separator| == 0 then 
    }

    function split(s: string, separator: string): seq<string> 
    {
        splitHelper(s, separator, 0, 0, [])
    }

    predicate Contains(haystack: string, needle: string)
        // ensures !NotContainsThree(haystack, needle)
    {
        if needle <= haystack then 
    }

    function splitOnBreak(s: string): seq<string> {
        if Contains(s, "\r\n") then split(s,"\r\n") else split(s,"\n")
    }

    function splitOnDoubleBreak(s: string): seq<string> {
        if Contains(s, "\r\n") then split(s,"\r\n\r\n") else split(s,"\n\n")
    }
}
