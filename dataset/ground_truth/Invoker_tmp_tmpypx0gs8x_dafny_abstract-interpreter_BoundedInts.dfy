// Modeled after https://github.com/dafny-lang/libraries/blob/master/src/BoundedInts.dfy

module BoundedInts {

  const TWO_TO_THE_0:   int := 1
  const TWO_TO_THE_1:   int := 2
  const TWO_TO_THE_2:   int := 4
  const TWO_TO_THE_4:   int := 16
  const TWO_TO_THE_5:   int := 32
  const TWO_TO_THE_8:   int := 0x100
  const TWO_TO_THE_16:  int := 0x10000
  const TWO_TO_THE_24:  int := 0x1000000
  const TWO_TO_THE_32:  int := 0x1_00000000
  const TWO_TO_THE_40:  int := 0x100_00000000
  const TWO_TO_THE_48:  int := 0x10000_00000000
  const TWO_TO_THE_56:  int := 0x1000000_00000000
  const TWO_TO_THE_64:  int := 0x1_00000000_00000000

  const S64_MIN : int64 := -0x8000_0000_0000_0000
  const S64_MAX : int64 := (0x8000_0000_0000_0000 - 1) as int64
  const U64_MIN : uint64 := 0
  const U64_MAX : uint64 := (TWO_TO_THE_64 - 1) as uint64

  const S32_MIN : int32 := -0x8000_0000
  const S32_MAX : int32:= (0x8000_0000 - 1) as int32
  const U32_MIN : uint32 := 0
  const U32_MAX : uint32 := 0x8000_0000 - 1


  newtype int8  = x: int  | -0x80 <= x < 0x80
  newtype int16 = x: int  | -0x8000 <= x < 0x8000
  newtype int32 = x: int  | -0x8000_0000 <= x < 0x8000_0000
  newtype int64 = x: int  | -0x8000_0000_0000_0000 <= x < 0x8000_0000_0000_0000

  newtype uint8 = x:int | 0 <= x < 0x100
  newtype uint16 = x:int | 0 <= x < 0x1_0000
  newtype uint32 = x:int | 0 <= x < 0x1_0000_0000
  newtype uint64 = x:int | 0 <= x < 0x1_00000000_00000000


  type byte = uint8
  type bytes = seq<byte>
}

