require "crinja"

module Amazonite::Codegen
  class Render
    @env : Crinja | Nil
    @service : Bindings::Service

    def initialize(@service, @crystal = Bindings::CrystalLang.new)
    end


    def to_file(description : Service::Description, filepath)
      operations = Amazonite::Codegen::Bindings::Operations.new(description.metadata, description.operations)
      to_file("client.cr", filepath, {"operations" => operations})
    end

    def to_file(e : Service::Enum, filepath)
      shape = Amazonite::Codegen::Bindings::Enum.new(e)
      to_file("enum.cr", filepath, {"shape" => shape})
    end

    def to_file(model : Service::Structure, filepath)
      shape = Amazonite::Codegen::Bindings::Structure.new(model)
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
      template.render(bindings)
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
