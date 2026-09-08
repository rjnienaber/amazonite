private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcPeeringConnectionOptionsRequest
    # The VPC peering connection options for the accepter VPC.
    property accepter_peering_connection_options : PeeringConnectionOptionsRequest | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The VPC peering connection options for the requester VPC.
    property requester_peering_connection_options : PeeringConnectionOptionsRequest | Nil

    # The ID of the VPC peering connection.
    property vpc_peering_connection_id : String

    def initialize(
      @vpc_peering_connection_id : String,
      @accepter_peering_connection_options : PeeringConnectionOptionsRequest | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @requester_peering_connection_options : PeeringConnectionOptionsRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accepter_peering_connection_options
        params.concat(value.to_query_params("#{prefix}AccepterPeeringConnectionOptions."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @requester_peering_connection_options
        params.concat(value.to_query_params("#{prefix}RequesterPeeringConnectionOptions."))
      end

      params << {"#{prefix}VpcPeeringConnectionId", @vpc_peering_connection_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accepter_peering_connection_options: node.xpath_node("*[local-name()='AccepterPeeringConnectionOptions']").try { |n| PeeringConnectionOptionsRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        requester_peering_connection_options: node.xpath_node("*[local-name()='RequesterPeeringConnectionOptions']").try { |n| PeeringConnectionOptionsRequest.from_xml(n) },
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcPeeringConnectionId']")).not_nil!,
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

    def_equals_and_hash(@accepter_peering_connection_options, @dry_run, @requester_peering_connection_options, @vpc_peering_connection_id)
  end
end
