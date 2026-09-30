private alias Core = Amazonite::Core

module Amazonite::EC2
  # The security group that the resource with the public IP address is in.
  class IpamPublicAddressSecurityGroup
    # The security group's name.
    property group_name : String | Nil

    # The security group's ID.
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
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_name, @group_id)
  end
end
