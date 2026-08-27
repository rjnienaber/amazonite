require "file_utils"
require "json"
require "./bindings/*"
require "./render"
require "./service/*"

# Parallel, standalone entry point that generates dynamodb_v2/ssm_v1 from the
# Smithy AST models in api-models-aws instead of the aws-sdk-js submodule,
# writing into tmp_smithy/ so the output can be diffed against tmp/ (produced
# by codegen.cr) to verify the two sources produce equivalent code. Not wired
# into the main `shards run codegen` pipeline - this is a verification-only
# script for the aws-sdk-js -> Smithy migration.
module Amazonite::Codegen
  # service name (as used in api-models-aws) => version_number to pass into
  # Description, hardcoded to match the module names already committed under
  # src/ (dynamodb_v2, ssm_v1) so the tmp_smithy/ output directories line up
  # 1:1 with tmp/ for diffing.
  SMITHY_TARGETS = {
    "dynamodb" => "2",
    "ssm"      => "1",
  }

  def self.main_smithy
    aws_version = Service::SmithyFiles.submodule_commit_sha

    SMITHY_TARGETS.each do |service, version_number|
      translator = Service::SmithyFiles.translator(service)
      puts "processing: #{service} (smithy, api version #{translator.api_version})"

      description = Service::Description.new(aws_version, translator.api_version, version_number, translator.translate)

      src_dir = File.join(Dir.current, "tmp_smithy")
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

    puts "finished building (smithy)"
  end
end

Amazonite::Codegen.main_smithy
