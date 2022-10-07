#!/usr/bin/env bash

set -e

watchexec -c -w src/core -w src/codegen -w src/codegen.cr -w spec/ -- crystal spec
