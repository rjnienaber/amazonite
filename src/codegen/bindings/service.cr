module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Service < Base
    @lower_name : String
    @version : String
    @aws_version : String
    @api_version : String
    @module_name : String
    @module_alias : String

    getter lower_name, version, api_version, aws_version, module_name, module_alias

    def initialize(description : Amazonite::Codegen::Service::Description)
      @lower_name = description.lower_name
      @aws_version = description.aws_version
      @api_version = description.api_version
      @version = description.version
      @module_name = description.module_name
      @module_alias = description.module_alias
    end
  end
end
