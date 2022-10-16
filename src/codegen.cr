require "./codegen/bindings/*"
require "./codegen/render"
require "./codegen/service/*"

module Amazonite::Codegen
  def self.main
    known_services = ["dynamodb"]
    known_services.each do |name|
      files = Service::Files.new(name)

      description = files.current_description

      src_dir = File.join(Dir.current, "src")
      module_dir = File.join(src_dir, description.lower_name)
      module_file_path = File.join(src_dir, "#{description.lower_name}.cr")

      FileUtils.rm_rf(module_dir)
      FileUtils.rm_rf(module_file_path)

      render = Render.new(description)

      # module
      puts "generating module"
      render.to_file("module.cr", module_file_path)

      # generate all enums
      description.enums.each do |shape|
        puts "generating enum #{shape.name}"
        model_filepath = File.join(module_dir, "#{shape.snake_case_name}.cr")
        render.enum_file(shape, model_filepath)
      end

      # generate all structures
      description.structures.each do |shape|
        puts "generating structure #{shape.name}"
        model_filepath = File.join(module_dir, "#{shape.snake_case_name}.cr")
        render.model_file(shape, model_filepath)
      end

      # generate errors
      puts "generating exception factory"
      exception_factory_file_path = File.join(module_dir, "exception_factory.cr")
      render.exception_factory_file(exception_factory_file_path)

      # client
      puts "generating client"
      client_filepath = File.join(module_dir, "client.cr")
      render.client_file(client_filepath)
    end

    puts "finished building"
  end
end

Amazonite::Codegen.main
