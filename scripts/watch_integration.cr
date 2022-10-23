#!/usr/bin/env -S crystal run

require "./get_env"

RDIO = Process::Redirect::Inherit

watch_files = [
  "scripts",
  "src/codegen",
  "src/codegen.cr",
  "src/core",
  "src/dynamodb_v2/",
  "integration",
]
watch_params = watch_files.map { |f| "-w #{f} " }.join
cmd = "watchexec --no-vcs-ignore -c #{watch_params}-- crystal spec integration/ --tag ~aws"
env = GetEnv.build
repo_root = File.expand_path(File.join(__DIR__, ".."))

Process.run(cmd, env: env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
