module Types_s
{


    datatype condition = eq | ne | ugt | uge | ult | ule | sgt | sge | slt | sle

    /////////////////
    // Native types
    /////////////////
    // newtype{:nativeType "bit"} bit = i:int | 0 <= i < 1
    newtype{:nativeType "byte"} byte = i:int | 0 <= i < 0x100
    newtype{:nativeType "uint"} uint = i:int | 0 <= i < 0x1_0000_0000
    newtype{:nativeType "ulong"} ulong = i:int | 0 <= i < 0x1_0000_0000_0000_0000


    ////////////////////////////////////////////////////////////////
    // Primitive data types
    ////////////////////////////////////////////////////////////////

    // The integer types as normally defined
    type uint8   = i:int | 0 <= i < 0x100
    type uint16  = i:int | 0 <= i < 0x10000
    type uint32  = i:int | 0 <= i < 0x1_0000_0000
    type uint64  = i:int | 0 <= i < 0x1_0000_0000_0000_0000
    type sint8   = i:int | -0x80 <= i < 0x80 
    type sint16  = i:int | -0x8000 <= i < 0x8000
    type sint32  = i:int | -0x8000_0000 <= i < 0x8000_0000
    type sint64  = i:int | -0x8000_0000_0000_0000 <= i < 0x8000_0000_0000_0000

    //ADD MATH FROM IRONFLEET? IE redo this
    type bitWidth = s:nat | (s == 1 || s == 2 || s == 4 || s == 8) ghost witness 1
    // Our integers have a type associated with them that stores their size and whether
    // they're signed/unsigned
    datatype IntType_ = IntType(size:bitWidth, signed:bool)
    type IntType = t:IntType_ | validBitWidth(t.size) ghost witness IntType(1, false)

    // Bytes is just that; a list of bytes
    type Byte = b:int | 0 <= b < 0x100
    type Bytes = b:seq<Byte> | |b| > 0 ghost witness [0]

    /////////////////
    // Quadword
    /////////////////

    datatype Quadword = Quadword(lo:uint32, mid_lo:uint32, mid_hi:uint32, hi:uint32)

    /////////////////
    // BitsOfByte
    /////////////////

    newtype{:nativeType "byte"} twobits = i:int | 0 <= i < 4
    datatype BitsOfByte = BitsOfByte(lo:twobits,
                                    mid_lo:twobits,
                                    mid_hi:twobits,
                                    hi:twobits)



    // A point of data is a primitive in our program. It could either be a sequence of bytes,
    // a pointer (in block/index form), or an integer. The validity of these is built into
    // the "Data" type
    datatype Data_ = Bytes(bytes:Bytes) |
                    Ptr(block:nat, bid:nat, offset:nat, size:bitWidth) |
                    Int(val:int, itype:IntType) | 
                    Void
    type Data = d:Data_ | (d.Int? ==> IntFits(d.val, d.itype)) ghost witness Bytes([0])

    // Specifies whether the given integer value fits in the given IntType; used for the
    // validity specification of Data
    predicate IntFits(val:int, itype:IntType) {
        var bound := Pow256(itype.size);
        if itype.signed then (-bound/2 <= val < bound/2)
        else (0 <= val < bound)
    }

    predicate isInt(data:Data)
    {
        data.Int?
    }

    predicate validBitWidth(s:nat)
    {
        (s == 1 || s == 2 || s == 4 || s == 8)
    }

    predicate typesMatch(x:Data, y:Data)
    {
        if isInt(x) then 
            x.itype.size == y.itype.size && x.itype.signed == y.itype.signed
        else
            x.size == y.size

    }

    // For aiding in converting between the size of a number in bytes and its bounds
    function Pow256(n:nat) : int
    {
        if n == 0 then 1
        else 0x100 * Pow256(n-1)
    }

    function Pow128(n:nat) : int
    {
        if n == 0 then 1
        else 0x80 * Pow128(n-1)
    }

    function  power2(exp: nat) : int
    {
        if (exp==0) then
            1
        else
            2*power2(exp-1)
    }

    function DataToUInt8(data:Data) : (out:uint8) 
}
