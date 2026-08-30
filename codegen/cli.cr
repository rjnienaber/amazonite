require "option_parser"
require "log"

module Amazonite::Codegen
  # Parses codegen's command-line flags (see GH issue #5): where to read the
  # api-models-aws checkout from, where to write generated code, how noisy to
  # log, and which services to restrict generation to.
  class Cli
    LOG_LEVELS = {
      "debug" => ::Log::Severity::Debug,
      "info"  => ::Log::Severity::Info,
      "warn"  => ::Log::Severity::Warn,
      "error" => ::Log::Severity::Error,
    }

    getter models_dir : String = "api-models-aws"
    getter output_dir : String = "tmp"
    getter log_level : ::Log::Severity = ::Log::Severity::Info
    getter services : Array(String) = [] of String
    getter protocols : Array(String) = [] of String

    # Parses `args` in place and returns self, or raises with a message
    # describing the bad flag/value.
    def parse(args : Array(String)) : self
      OptionParser.parse(args) do |parser|
        parser.banner = "Usage: codegen [options]"

        parser.on("-m DIR", "--models-dir=DIR",
          "Directory containing the api-models-aws checkout (default: #{@models_dir})") do |v|
          @models_dir = v
        end

        parser.on("-o DIR", "--output-dir=DIR",
          "Directory to write generated code to (default: #{@output_dir})") do |v|
          @output_dir = v
        end

        parser.on("-s NAME", "--service=NAME",
          "Only generate the named service (repeatable); default is every known target") do |v|
          @services << v
        end

        parser.on("-p TYPE", "--protocol=TYPE",
          "Only generate services using this protocol, e.g. json, rest-json, query, rest-xml, ec2 (repeatable)") do |v|
          @protocols << v
        end

        parser.on("-l LEVEL", "--log-level=LEVEL",
          "Log verbosity: #{LOG_LEVELS.keys.join(", ")} (default: info)") do |v|
          @log_level = LOG_LEVELS.fetch(v.downcase) do
            raise Exception.new("unknown log level '#{v}', expected one of: #{LOG_LEVELS.keys.join(", ")}")
          end
        end

        parser.on("-h", "--help", "Show this help") do
          puts parser
          exit
        end

        parser.invalid_option do |flag|
          raise Exception.new("#{flag} is not a valid option\n#{parser}")
        end
      end

      self
    end
  end
end
