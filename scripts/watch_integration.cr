#!/usr/bin/env -S crystal run

require "./test_helper"

RDIO = Process::Redirect::Inherit

watch_files = [
  "scripts",
  "codegen",
  "src/core",
  "src/dynamodb_v2/",
  "integration",
]
watch_params = watch_files.map { |f| "-w #{f} " }.join

helper = TestHelper.new

cmd = "watchexec -c --no-vcs-ignore #{watch_params}-- crystal spec -D#{helper.test_tags} integration/"
repo_root = File.expand_path(File.join(__DIR__, ".."))

Process.run(cmd, env: helper.env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
