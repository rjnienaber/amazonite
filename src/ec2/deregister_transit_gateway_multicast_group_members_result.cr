private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeregisterTransitGatewayMulticastGroupMembersResult
    # Information about the deregistered members.
    property deregistered_multicast_group_members : TransitGatewayMulticastDeregisteredGroupMembers | Nil

    def initialize(
      @deregistered_multicast_group_members : TransitGatewayMulticastDeregisteredGroupMembers | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @deregistered_multicast_group_members
        params.concat(value.to_query_params("#{prefix}DeregisteredMulticastGroupMembers."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deregistered_multicast_group_members: node.xpath_node("*[local-name()='deregisteredMulticastGroupMembers']").try { |n| TransitGatewayMulticastDeregisteredGroupMembers.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @deregistered_multicast_group_members
        value.validate!
      end
    end

    def_equals_and_hash(@deregistered_multicast_group_members)
  end
end
