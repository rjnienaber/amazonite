private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteInstanceProfileRequest
    property instance_profile_name : String

    def initialize(
      @instance_profile_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
      )
    end
  end
end
