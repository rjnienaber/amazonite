private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateRoleDescriptionRequest
    property role_name : String

    property description : String

    def initialize(
      @role_name : String,
      @description : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}Description", @description}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")).not_nil!,
      )
    end
  end
end
