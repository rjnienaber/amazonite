require "crinja"

module Amazonite::Codegen
  class Render
    @env : Crinja | Nil
    @service : Bindings::Service

    def initialize(@description : Service::Description)
      @service = Bindings::Service.new(description)
      @crystal = Bindings::CrystalLang.new
    end

    def exception_factory_file(filepath)
      errors = Amazonite::Codegen::Bindings::Errors.new(@description.error_names)
      to_file("exception_factory.cr", filepath, {"errors" => errors})
    end

    def client_file(filepath)
      operations = Amazonite::Codegen::Bindings::Operations.new(@description)
      to_file("client.cr", filepath, {"operations" => operations})
    end

    def enum_file(e : Service::Enum, filepath)
      shape = Amazonite::Codegen::Bindings::Enum.new(e)
      to_file("enum.cr", filepath, {"shape" => shape})
    end

    def model_file(model : Service::Structure, filepath)
      shape = Amazonite::Codegen::Bindings::Structure.new(model, @description.module_alias)
      to_file("model.cr", filepath, {"shape" => shape})
    end

    def to_file(template_name : String, filepath : String, bindings = {} of String => Bindings::Base)
      FileUtils.mkdir_p(File.dirname(filepath))
      File.write(filepath, to_s(template_name, bindings))
    end

    def to_s(template_name, bindings = {} of String => Bindings::Base)
      base_bindings = {"service" => @service, "crystal" => @crystal}
      render(template_name, Crinja.variables(base_bindings.merge(bindings)))
    end

    private def render(template_name : String, bindings : Crinja::Variables)
      template = self.template_env.get_template("#{template_name}.j2")
      template.render(bindings).strip + "\n"
    end

    private def template_env
      return @env.as(Crinja) unless @env.nil?
      env = Crinja.new
      path = File.join(__DIR__, "templates")
      env.loader = Crinja::Loader::FileSystemLoader.new(path)
      @env = env
    end
  end
end
