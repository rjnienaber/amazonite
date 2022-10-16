#!/usr/bin/env bash

set -e

watchexec -c -w scripts -w src/codegen -w src/codegen.cr -w src/core "crystal run src/codegen.cr && ./scripts/compile_dynamodb.sh && echo finished compiling"