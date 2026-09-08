require "json"
require "./translator"

module Amazonite::Codegen::Service
  # Locates and parses a service's Smithy JSON AST model from the
  # api-models-aws submodule.
  class Files
    # Root of the api-models-aws checkout (submodule by default, but
    # overridable via the codegen CLI's --models-dir so a developer can point
    # at an arbitrary clone instead).
    class_getter models_dir : String = "api-models-aws"

    def self.models_dir=(dir : String) : String
      @@model_versions = nil if dir != @@models_dir
      @@models_dir = dir
    end

    # api-models-aws directory names don't always match the service slugs
    # used historically (dynamodb, ssm, ...) - only the exceptions need an
    # entry here, everything else defaults to slug == directory name.
    SERVICE_DIRS = {
      "kinesisanalyticsv2"     => "kinesis-analytics-v2",
      "elasticloadbalancingv2" => "elastic-load-balancing-v2",
      "discovery"              => "application-discovery-service",
    }

    SLUG_WITH_DATE = /^(.+?)-(\d{4}-\d\d-\d\d)\.normal\.json$/

    # api-models-aws tracks a semver per service in this file, keyed by the
    # same directory name the models live under (model.sqs.version=1.0.6).
    # Upstream only ever bumps the patch component, once per model release
    # that touches that service.
    VERSIONS_FILE = "gradle.properties"

    VERSION_KEY = /^model\.(?<service>.+)\.version$/

    @@model_versions : Hash(String, String)?

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

    # The upstream model version for a service, used as the generated
    # module's VERSION. Takes the same names as .translator.
    def self.model_version(name : String) : String
      slug = SLUG_WITH_DATE.match(name).try(&.[1]) || name
      dir = SERVICE_DIRS.fetch(slug, slug)

      model_versions.fetch(dir) do
        raise Exception.new("no model.#{dir}.version in #{models_dir}/#{VERSIONS_FILE}")
      end
    end

    private def self.model_versions : Hash(String, String)
      @@model_versions ||= begin
        path = File.join(models_dir, VERSIONS_FILE)
        raise Exception.new("couldn't find #{path}") unless File.file?(path)

        versions = {} of String => String
        File.each_line(path) do |line|
          key, _, value = line.partition("=")
          # the file also carries org.gradle.* build settings, and an "all"
          # roll-up that moves whenever any service does - neither names a
          # service we generate
          next unless match = VERSION_KEY.match(key.strip)
          next if match["service"] == "all"

          versions[match["service"]] = value.strip
        end
        versions
      end
    end
  end
end
