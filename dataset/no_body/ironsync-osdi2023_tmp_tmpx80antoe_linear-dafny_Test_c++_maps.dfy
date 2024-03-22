// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint32 = i:int | 0 <= i < 0x100000000

method Test(name:string, b:bool)
  requires b
{/* TODO */ }

datatype map_holder = map_holder(m:map<bool, bool>)

method Basic() {/* TODO */ }


method Main() {/* TODO */ }

method TestMapMergeSubtraction() {/* TODO */ }

method TestMapMerge() {/* TODO */ }

method TestMapSubtraction() {/* TODO */ }

class MyClass {
  const name: string
  constructor (name: string) {
    this.name := name;
  }
}

method TestNullsAmongKeys() {/* TODO */ }

method GenericMap<K, V>(m: map<K, V>, n: map<K, V>, o: map<K, V>, a: K, b: K)
    returns (p: map<K, V>, q: map<K, V>, r: map<K, V>)
  requires a in m.Keys && a in n.Keys
  requires b !in m.Keys && b !in o.Keys
  ensures p == m + n && q == n + o && r == o + m
{/* TODO */ }

method TestNullsAmongValues() {/* TODO */ }

