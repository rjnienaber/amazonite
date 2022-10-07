module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Service < Base
    @name : String
    @version : String

    getter name, version

    def initialize(@description : Amazonite::Codegen::Service::Description)
      @name = @description.metadata.service_id
      @version = @description.aws_version
    end

    def lower_name
      name.downcase
    end
  end
end
