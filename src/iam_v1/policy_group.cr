private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyGroup
    property group_name : String | Nil

    property group_id : String | Nil

    def initialize(
      @group_name : String | Nil = nil,
      @group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
      )
    end
  end
end
