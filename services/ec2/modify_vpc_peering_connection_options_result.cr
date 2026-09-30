private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcPeeringConnectionOptionsResult
    # Information about the VPC peering connection options for the accepter VPC.
    property accepter_peering_connection_options : PeeringConnectionOptions | Nil

    # Information about the VPC peering connection options for the requester VPC.
    property requester_peering_connection_options : PeeringConnectionOptions | Nil

    def initialize(
      @accepter_peering_connection_options : PeeringConnectionOptions | Nil = nil,
      @requester_peering_connection_options : PeeringConnectionOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accepter_peering_connection_options
        params.concat(value.to_query_params("#{prefix}AccepterPeeringConnectionOptions."))
      end

      if value = @requester_peering_connection_options
        params.concat(value.to_query_params("#{prefix}RequesterPeeringConnectionOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accepter_peering_connection_options: node.xpath_node("*[local-name()='accepterPeeringConnectionOptions']").try { |n| PeeringConnectionOptions.from_xml(n) },
        requester_peering_connection_options: node.xpath_node("*[local-name()='requesterPeeringConnectionOptions']").try { |n| PeeringConnectionOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @accepter_peering_connection_options
        value.validate!
      end

      if value = @requester_peering_connection_options
        value.validate!
      end
    end

    def_equals_and_hash(@accepter_peering_connection_options, @requester_peering_connection_options)
  end
end
