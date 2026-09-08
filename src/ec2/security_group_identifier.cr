private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group.
  class SecurityGroupIdentifier
    # The ID of the security group.
    property group_id : String | Nil

    # The name of the security group.
    property group_name : String | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @group_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_id, @group_name)
  end
end
