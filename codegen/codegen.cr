require "./bindings/*"
require "./service/*"
require "./files"
require "./render"

module Amazonite::Codegen
  def self.main
    Files.process("query") do |files|
      puts "processing: #{files.current_normal_file}"

      description = files.current_description

      src_dir = File.join(Dir.current, "tmp")

      module_name = "#{description.lower_name}_#{description.lower_version}"
      module_dir = File.join(src_dir, module_name)
      module_file_path = File.join(src_dir, "#{module_name}.cr")

      next if File.exists?(module_file_path)

      FileUtils.rm_rf(module_dir)
      FileUtils.rm_rf(module_file_path)

      render = Render.new(description)

      # generate all enums
      puts "  generating enums"
      description.enums.each do |shape|
        model_filepath = File.join(module_dir, "#{shape.snake_case_name}.cr")
        render.enum_file(shape, model_filepath)
      end

      # generate all structures
      puts "  generating structures"
      description.structures.each do |shape|
        model_filepath = File.join(module_dir, "#{shape.snake_case_name}.cr")
        render.model_file(shape, model_filepath)
      end

      # generate errors
      puts "  generating exception factory"
      exception_factory_file_path = File.join(module_dir, "exception_factory.cr")
      render.exception_factory_file(exception_factory_file_path)

      # client
      puts "  generating client"
      client_filepath = File.join(module_dir, "client.cr")
      render.client_file(client_filepath)

      # module
      puts "  generating module"
      render.to_file("module.cr", module_file_path)
    end

    puts "finished building"
  end
end

Amazonite::Codegen.main
