module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Service < Base
    @lower_name : String
    @version : String
    @lower_version : String
    @module_slug : String
    @aws_version : String
    @api_version : String
    @module_name : String
    @module_alias : String
    @protocol : String

    getter lower_name, version, lower_version, module_slug, api_version, aws_version, module_name, module_alias, protocol

    def initialize(description : Amazonite::Codegen::Service::Description)
      @lower_name = description.lower_name
      @aws_version = description.aws_version
      @api_version = description.api_version
      @version = description.version
      @lower_version = description.lower_version
      @module_slug = description.module_slug
      @module_name = description.module_name
      @module_alias = description.module_alias
      @protocol = description.metadata.protocol
    end
  end
end
