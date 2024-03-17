
module DiskTypesMod {
  type AU = nat
  // QUESTION: Can we add a clean/dirty bit here??
  datatype CU = CU(au: AU, offset: nat)
  type UninterpretedDiskPage

  function DiskSizeInAU() : (s:nat)
  function {:opaque} CUsInDisk() : set<CU>
  {
    set au,offset | 0<=au<DiskSizeInAU() && 0<=offset<AUSizeInCUs() :: CU(au,offset)
  }

  predicate ValidCU(cu: CU) {
    && 0 <= cu.au < DiskSizeInAU()
    && 0 <= cu.offset < AUSizeInCUs()
  }

  type DiskView = map<CU, UninterpretedDiskPage>
}

