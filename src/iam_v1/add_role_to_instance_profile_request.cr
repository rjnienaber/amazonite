private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AddRoleToInstanceProfileRequest
    property instance_profile_name : String

    property role_name : String

    def initialize(
      @instance_profile_name : String,
      @role_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}

      params << {"#{prefix}RoleName", @role_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
      )
    end
  end
end
