#!/usr/bin/env -S crystal run

require "./test_helper"

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

helper = TestHelper.create

cmd = "watchexec --no-vcs-ignore #{watch_params}-- crystal spec integration/ --tag ~#{helper.test_tags}"
repo_root = File.expand_path(File.join(__DIR__, ".."))

Process.run(cmd, env: helper.env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
