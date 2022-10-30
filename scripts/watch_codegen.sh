#!/usr/bin/env bash

set -e

watchexec -c -w scripts -w src/codegen -w src/codegen.cr -w src/core "rm -rf tmp/* && cp -R src/core tmp && crystal run src/codegen.cr && ./scripts/compile.sh && echo finished compiling"