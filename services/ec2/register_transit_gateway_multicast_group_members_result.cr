private alias Core = Amazonite::Core

module Amazonite::EC2
  class RegisterTransitGatewayMulticastGroupMembersResult
    # Information about the registered transit gateway multicast group members.
    property registered_multicast_group_members : TransitGatewayMulticastRegisteredGroupMembers | Nil

    def initialize(
      @registered_multicast_group_members : TransitGatewayMulticastRegisteredGroupMembers | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @registered_multicast_group_members
        params.concat(value.to_query_params("#{prefix}RegisteredMulticastGroupMembers."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        registered_multicast_group_members: node.xpath_node("*[local-name()='registeredMulticastGroupMembers']").try { |n| TransitGatewayMulticastRegisteredGroupMembers.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @registered_multicast_group_members
        value.validate!
      end
    end

    def_equals_and_hash(@registered_multicast_group_members)
  end
end
