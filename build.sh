#!/bin/sh

source /quasi-msys2/env/all.src
RUSTFLAGS='-C target-feature=+crt-static' cargo build --release
cp /mingw64/bin/*.dll /app/target/x86_64-pc-windows-gnu/release/
