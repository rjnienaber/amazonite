private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateGroupRequest
    property path : String | Nil

    property group_name : String

    def initialize(
      @group_name : String,
      @path : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}GroupName", @group_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
      )
    end
  end
end
