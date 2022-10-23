#!/usr/bin/env -S crystal run

require "./get_env"

RDIO = Process::Redirect::Inherit

env = GetEnv.build
exclude_tag = env["AWS_PROFILE"] == "local" ? "aws" : "localstack"

cmd = "crystal spec integration/ --tag ~#{exclude_tag}"

repo_root = File.expand_path(File.join(__DIR__, ".."))

Process.run(cmd, env: env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
