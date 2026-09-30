#!/usr/bin/env bash

set -e

watchexec -c -w scripts -w codegen -w src/core "rm -rf tmp/* && mkdir -p tmp/src && cp -R src/core tmp/src && crystal run codegen/codegen.cr && ./scripts/compile.sh && echo finished compiling"