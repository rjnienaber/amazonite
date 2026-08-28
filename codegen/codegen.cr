require "file_utils"
require "json"
require "./bindings/*"
require "./render"
require "./service/*"

module Amazonite::Codegen
  # service name (as used in api-models-aws) => version_number to pass into
  # Description. The version suffix on a generated module name (e.g. the "2"
  # in dynamodb_v2) is a historical artifact of aws-sdk-js's multi-dated-file
  # history and isn't re-derivable from Smithy (which ships only the current
  # model per service) - so it's tracked explicitly here per target rather
  # than computed, to avoid ever silently renaming an already-published
  # module.
  TARGETS = {
    "dynamodb" => "2",
    "ssm"      => "1",
  }

  def self.main
    aws_version = Service::Files.submodule_commit_sha

    TARGETS.each do |service, version_number|
      translator = Service::Files.translator(service)
      puts "processing: #{service} (api version #{translator.api_version})"

      description = Service::Description.new(aws_version, translator.api_version, version_number, translator.translate)

      src_dir = File.join(Dir.current, "tmp")
      module_name = "#{description.lower_name}_#{description.lower_version}"
      module_dir = File.join(src_dir, module_name)
      module_file_path = File.join(src_dir, "#{module_name}.cr")

      FileUtils.rm_rf(module_dir)
      FileUtils.rm_rf(module_file_path)

      render = Render.new(description)

      puts "  generating enums"
      description.enums.each do |shape|
        render.enum_file(shape, File.join(module_dir, "#{shape.snake_case_name}.cr"))
      end

      puts "  generating structures"
      description.structures.each do |shape|
        render.model_file(shape, File.join(module_dir, "#{shape.snake_case_name}.cr"))
      end

      puts "  generating exception factory"
      render.exception_factory_file(File.join(module_dir, "exception_factory.cr"))

      puts "  generating client"
      render.client_file(File.join(module_dir, "client.cr"))

      puts "  generating module"
      render.to_file("module.cr", module_file_path)
    end

    puts "finished building"
  end
end

Amazonite::Codegen.main
