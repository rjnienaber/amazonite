#!/usr/bin/env -S crystal run

require "./test_helper"

RDIO = Process::Redirect::Inherit

helper = TestHelper.new

cmd = "crystal spec -D#{helper.test_tags} integration/"
repo_root = File.expand_path(File.join(__DIR__, ".."))
Process.run(cmd, env: helper.env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
