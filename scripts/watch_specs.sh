#!/usr/bin/env bash

set -e

watchexec -c -w src/core -w codegen -w spec/ -- crystal spec
