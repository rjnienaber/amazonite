require "json"
require "./smithy_translator"

module Amazonite::Codegen::Service
  # Locates and parses a service's Smithy JSON AST model from the
  # api-models-aws submodule. Mirrors Files' role for aws-sdk-js, but the
  # api-models-aws layout ships exactly one model file per service (no
  # multi-date history to disambiguate), so discovery is much simpler.
  class SmithyFiles
    MODELS_DIR = "api-models-aws/models"

    @@submodule_commit_sha : String?

    def self.translator(service : String) : SmithyTranslator
      pattern = File.join(MODELS_DIR, service, "service", "*", "#{service}-*.json")
      matches = Dir[pattern]
      raise Exception.new("couldn't find Smithy model for '#{service}' (looked for #{pattern})") if matches.empty?
      raise Exception.new("multiple Smithy model files found for '#{service}': #{matches}") if matches.size > 1

      SmithyTranslator.new(JSON.parse(File.read(matches.first)))
    end

    def self.submodule_commit_sha : String
      @@submodule_commit_sha ||= begin
        output = IO::Memory.new
        Process.run("git", ["-C", "api-models-aws", "rev-parse", "--short", "HEAD"], output: output)
        output.to_s.strip
      end
    end
  end
end
