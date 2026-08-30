require "file_utils"
require "json"
require "log"
require "./bindings/*"
require "./cli"
require "./render"
require "./service/*"

module Amazonite::Codegen
  # service names (as used in api-models-aws) to generate a module for.
  TARGETS = [
    "dynamodb",
    "ssm",
    "sqs",
    "kms",
    "secrets-manager",
    "lambda",
    "sns",
    "iam",
    "cloudwatch",
    "sts",
    "cloudformation",
    "api-gateway",
    "eventbridge",
    "cloudwatch-logs",
    "kinesis",
  ]

  # Operations that can't be modeled as a plain request/response call and
  # are excluded from generation, keyed by service. InvokeWithResponseStream
  # uses Smithy's event-stream protocol (application/vnd.amazon.eventstream
  # chunked multiplexed events) rather than a single JSON/binary body -
  # genuinely different HTTP handling that a request/response client can't
  # represent, so it's dropped rather than mis-generated (same precedent as
  # OpsWorks being dropped from the aws-sdk-js -> Smithy cutover).
  EXCLUDED_OPERATIONS = {
    "lambda"          => ["InvokeWithResponseStream"],
    "cloudwatch-logs" => ["GetLogObject", "StartLiveTail"],
    "kinesis"         => ["SubscribeToShard"],
  }

  def self.main(args = ARGV)
    cli = Cli.new.parse(args)
    ::Log.setup(level: cli.log_level)
    Service::Files.models_dir = cli.models_dir

    targets = TARGETS
    unless cli.services.empty?
      unknown = cli.services - TARGETS
      raise Exception.new("unknown --service value(s): #{unknown.join(", ")} (known targets: #{TARGETS.join(", ")})") unless unknown.empty?
      targets = TARGETS.select { |service| cli.services.includes?(service) }
    end

    aws_version = Service::Files.submodule_commit_sha

    targets.each do |service|
      translator = Service::Files.translator(service)
      ::Log.info { "processing: #{service} (api version #{translator.api_version})" }

      description = Service::Description.new(aws_version, translator.api_version, translator.translate)

      unless cli.protocols.empty?
        unless cli.protocols.includes?(description.metadata.protocol)
          ::Log.info { "  skipping #{service}: protocol '#{description.metadata.protocol}' not in --protocol filter" }
          next
        end
      end

      excluded = EXCLUDED_OPERATIONS[service]?
      description.operations.reject! { |op| excluded.includes?(op.name) } if excluded

      src_dir = File.expand_path(cli.output_dir)
      module_dir = File.join(src_dir, description.module_slug)
      module_file_path = File.join(src_dir, "#{description.module_slug}.cr")

      FileUtils.rm_rf(module_dir)
      FileUtils.rm_rf(module_file_path)

      render = Render.new(description)

      ::Log.info { "  generating enums" }
      description.enums.each do |shape|
        render.enum_file(shape, File.join(module_dir, "#{shape.snake_case_name}.cr"))
      end

      ::Log.info { "  generating structures" }
      description.structures.each do |shape|
        render.model_file(shape, File.join(module_dir, "#{shape.snake_case_name}.cr"))
      end

      ::Log.info { "  generating exception factory" }
      render.exception_factory_file(File.join(module_dir, "exception_factory.cr"))

      ::Log.info { "  generating client" }
      render.client_file(File.join(module_dir, "client.cr"))

      ::Log.info { "  generating module" }
      render.to_file("module.cr", module_file_path)
    end

    ::Log.info { "finished building" }
  end
end

Amazonite::Codegen.main
