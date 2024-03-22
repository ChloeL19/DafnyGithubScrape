// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module Io {
  predicate AdvanceTime(oldTime:int) { oldTime > 2 }
  class Time
  {
    static method GetTime()
        ensures AdvanceTime(1);
  }

  function MaxPacketSize() : int {/* TODO */ }

  class UdpClient
  {
    method Receive()
        ensures AdvanceTime(3);

    method Send() returns(ok:bool)
        requires 0 <= MaxPacketSize();
  }
}

abstract module Host {/* TODO */ }

abstract module Main {
    import H : Host
}

