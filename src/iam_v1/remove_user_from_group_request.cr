private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RemoveUserFromGroupRequest
    property group_name : String

    property user_name : String

    def initialize(
      @group_name : String,
      @user_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}UserName", @user_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
      )
    end
  end
end
