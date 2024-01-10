#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <automerge-swift source dir>"
    exit 1
fi

AUTOMERGE_SWIFT_SOURCE_DIR=$1

cargo build --manifest-path $AUTOMERGE_SWIFT_SOURCE_DIR/rust/Cargo.toml --target wasm32-wasi --release

cp $AUTOMERGE_SWIFT_SOURCE_DIR/rust/target/wasm32-wasi/release/libuniffi_automerge.a libuniffi_automerge.a
