// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module Io {
  predicate AdvanceTime(oldTime:int) { oldTime > 2 }
  class Time
  {
    static method GetTime()
  }

  function MaxPacketSize() : int { 65507 }

  class UdpClient
  {
    method Receive()
  }
}

abstract module Host {
    import opened Io // Doesn't work.
    //import Io          // Works
}

abstract module Main {
    import H : Host
}

