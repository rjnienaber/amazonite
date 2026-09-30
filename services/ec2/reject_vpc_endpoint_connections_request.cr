private alias Core = Amazonite::Core

module Amazonite::EC2
  class RejectVpcEndpointConnectionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the service.
    property service_id : String

    # The IDs of the VPC endpoints.
    property vpc_endpoint_ids : Array(String) = [] of String

    def initialize(
      @service_id : String,
      @vpc_endpoint_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

      @vpc_endpoint_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}VpcEndpointId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        vpc_endpoint_ids: node.xpath_nodes("*[local-name()='VpcEndpointId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @vpc_endpoint_ids)
  end
end
