#!/usr/bin/env bash

set -e

watchexec -c -w scripts -w codegen -w src/core "rm -rf tmp/* && cp -R src/core tmp && crystal run codegen/codegen.cr && ./scripts/compile.sh && echo finished compiling"