module FindAndReplace {

    export  
        reveals verify
        provides findAndReplace

    function verify(str:string, toFind:string, toReplace:string) : string 
    requires |toFind| > 0
    decreases str
    {
        if |str| < |toFind| 
        then
            str 
        else 
            if str[..|toFind|] == toFind 
            then
                toReplace + verify(str[|toFind|..], toFind, toReplace)
            else
                str[..1] + verify(str[1..], toFind, toReplace)
    }

    method findAndReplace(str : string, toFind : string, toReplace : string) returns (newString : string)
    requires |toFind| > 0
    ensures newString == verify(str, toFind, toReplace)
    decreases str
    {
        if (|str| < |toFind|)
        {
            return str;
        }

        if (toFind <= str)
        {
            var result := findAndReplace(str[|toFind|..], toFind, toReplace);
            return toReplace + result;
        }
        else
        {
            var result := findAndReplace(str[1..], toFind, toReplace);
            return str[..1] + result;
        }
        
    }
}













