// RUN: %dafny /compile:3 "%s" /compileTarget:js > "%t"
// note: putting /compileTarget:js after "%s" overrides user-provided option
// RUN: %diff "%s.expect" "%t"

// "url" is a built-in package in node, so it should be accessible to the
// test suite without further requirements on the setup.
module {:extern "url", "url"} URL {
  class Url {
    var host: string
    var pathname: string
    var search: string
  }
  method {:extern "parse"} Parse(address: string, b: bool) returns (u: Url)
}

method Main() {/* TODO */ }

