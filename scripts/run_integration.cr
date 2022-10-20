#!/usr/bin/env -S crystal run

RDIO = Process::Redirect::Inherit

repo_root = File.expand_path(File.join(__DIR__, ".."))
crystal_path = "#{Crystal::PATH}:.."
env = {"CRYSTAL_PATH" => crystal_path}

cmd = "crystal spec integration/"

Process.run(cmd, env: env, chdir: repo_root, shell: true, input: RDIO, output: RDIO, error: RDIO)
