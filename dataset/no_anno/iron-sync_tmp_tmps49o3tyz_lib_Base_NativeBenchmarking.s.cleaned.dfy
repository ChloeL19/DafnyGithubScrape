// Some utilities for benchmarking via explicit instrumentation.

module {:extern} NativeBenchmarking {
  method {:extern "NativeBenchmarking_Compile", "start"} start(name: string)
  method {:extern "NativeBenchmarking_Compile", "start"} start(name: string)
  method {:extern "NativeBenchmarking_Compile", "end"} end(name: string)
  method {:extern "NativeBenchmarking_Compile", "end"} end(name: string)
}

