require "json"
require "./translator"

module Amazonite::Codegen::Service
  # Locates and parses a service's Smithy JSON AST model from the
  # api-models-aws submodule.
  class Files
    # Root of the api-models-aws checkout (submodule by default, but
    # overridable via the codegen CLI's --models-dir so a developer can point
    # at an arbitrary clone instead).
    class_property models_dir : String = "api-models-aws"

    # api-models-aws directory names don't always match the service slugs
    # used historically (dynamodb, ssm, ...) - only the exceptions need an
    # entry here, everything else defaults to slug == directory name.
    SERVICE_DIRS = {
      "kinesisanalyticsv2"     => "kinesis-analytics-v2",
      "elasticloadbalancingv2" => "elastic-load-balancing-v2",
      "discovery"              => "application-discovery-service",
    }

    SLUG_WITH_DATE = /^(.+?)-(\d{4}-\d\d-\d\d)\.normal\.json$/

    @@submodule_commit_sha : String?

    # Accepts either a bare service slug (e.g. "dynamodb") or an old-format
    # filename (e.g. "dynamodb-2012-08-10.normal.json") for spec call-site
    # compatibility. Either way, resolves to the one Smithy model file for
    # that service (optionally pinned to a specific date).
    def self.translator(name : String) : Translator
      if match = SLUG_WITH_DATE.match(name)
        slug, date = match[1], match[2]
      else
        slug, date = name, nil
      end

      dir = SERVICE_DIRS.fetch(slug, slug)
      # Dir[] glob patterns always use "/" regardless of platform - File.join
      # would emit "\" on Windows and silently match nothing there.
      pattern = "#{models_dir}/models/#{dir}/service/#{date || "*"}/*.json"
      matches = Dir[pattern]
      raise Exception.new("couldn't find Smithy model for '#{name}' (looked for #{pattern})") if matches.empty?
      raise Exception.new("multiple Smithy model files found for '#{name}': #{matches}") if matches.size > 1

      Translator.new(JSON.parse(File.read(matches.first)))
    end

    def self.submodule_commit_sha : String
      @@submodule_commit_sha ||= begin
        output = IO::Memory.new
        Process.run("git", ["-C", models_dir, "rev-parse", "--short", "HEAD"], output: output)
        output.to_s.strip
      end
    end
  end
end
