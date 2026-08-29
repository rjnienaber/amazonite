private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateGroupRequest
    property group_name : String

    property new_path : String | Nil

    property new_group_name : String | Nil

    def initialize(
      @group_name : String,
      @new_path : String | Nil = nil,
      @new_group_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      if value = @new_path
        params << {"#{prefix}NewPath", value}
      end

      if value = @new_group_name
        params << {"#{prefix}NewGroupName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        new_path: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPath']")),
        new_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewGroupName']")),
      )
    end
  end
end
