// RUN: echo Compiled elsewhere
// This file is part of the test suite. It is compiled by DafnyLibClient.dfy,
// since the DLL from this file is a dependency of DafnyLibClient.

// Regression test for the way the compiler used to disambiguate modules with the same
// name, but in different locations in the nested module tree: it added a _##_ prefix
// with the index of the module in the topographical sorted list of modules.
// That index would change based on what other modules where in scope, though, so
// it wouldn't be the same across DLLs. The abstract compiler now passed the fully-qualified
// name, separated with periods. It's up to the target language compiler to create valid
// module identifiers from that somehow.
// This module is here and specifically BEFORE the nested one so that it makes the
// module index different between the DLL and the client.
module AmbiguousNestedModule {}

module Library {
  import OpaqueFunctions
  import AutoGhostRegression
  import ExternCode

  method EntryPoint() {/* TODO */ }
  
  module AmbiguousNestedModule {
    method EntryPoint() {/* TODO */ }
  }
}

module {:extern "ExternCode"} ExternCode {
  method {:extern} C()
}

// ---------- regression tests ---------------

module OpaqueFunctions {/* TODO */ }

module AutoGhostRegression {
  method P() returns (a: int, ghost b: int) {/* TODO */ }
  method NeedsNonGhost(u: int) {/* TODO */ }
  method Q() {/* TODO */ }
}

