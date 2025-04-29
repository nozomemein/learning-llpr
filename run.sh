#!/usr/bin/env bash
set -eu

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <basename>"
  exit 1
fi
base="$1"            # 例: hello
asm="${base}.asm"    # 例: hello.asm
obj="${base}.o"      # 例: hello.o
bin="${base}"        # 例: hello

echo "[1/4] assemble  : nasm -felf64 ${asm} -o ${obj}"
nasm -felf64 "${asm}" -o "${obj}"

echo "[2/4] link       : ld -o ${bin} ${obj}"
ld -o "${bin}" "${obj}"

echo "[3/4] chmod +x   : ${bin}"
chmod u+x "${bin}"

echo "[4/4] run        : ./${bin}"
"./${bin}"
