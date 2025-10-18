#!/usr/bin/env sh
set -eu

# Build the C99 reference deterministically (as much as is practical)
# Requires a POSIX `cc`.
echo "[build] compiling C99 reference..."
mkdir -p bin build
${CC:-cc} -std=c99 -O2 -Wall -Wextra -pedantic -c src/c99/longrun.c -o build/longrun.o
${CC:-cc} build/longrun.o -o bin/longrun
echo "[build] done: bin/longrun"

# Optional: compile WAT -> WASM if `wat2wasm` exists
if command -v wat2wasm >/dev/null 2>&1; then
  echo "[build] compiling WASM (wat2wasm)..."
  wat2wasm src/wasm/ref_impl.wat -o bin/ref_impl.wasm
  echo "[build] done: bin/ref_impl.wasm"
else
  echo "[build] skip WASM (wat2wasm not found)"
fi
