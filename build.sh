#!/bin/sh

source /quasi-msys2/env/all.src
#RUSTFLAGS='-C target-feature=+crt-static -C link-args=-static -C link-args=-static-libgcc'
cargo build --release
win-ldd target/x86_64-pc-windows-gnu/release/reproduction.exe |
    grep "=>" |
    grep -v "wine" |
    while read -r line; do
        dll_path=$(echo "$line" | sed 's/.*=> \(.*\) (.*)/\1/')
        [ -f "$dll_path" ] && cp "$dll_path" /app/target/x86_64-pc-windows-gnu/release
    done
#cp /mingw64/bin/* /app/target/x86_64-pc-windows-gnu/release
