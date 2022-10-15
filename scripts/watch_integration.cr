#!/usr/bin/env -S crystal run

RDIO = Process::Redirect::Inherit

repo_root = File.expand_path(File.join(__DIR__, ".."))
crystal_path = "#{Crystal::PATH}:.."
env = {"CRYSTAL_PATH" => crystal_path}

watch_files = [
  "scripts",
  "src/codegen",
  "src/codegen.cr",
  "src/core",
  "integration",
]
watch_params = watch_files.map { |f| "-w #{f} " }.join
cmd = "watchexec -c #{watch_params}-- crystal spec integration/"

Process.run(cmd, env: env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
