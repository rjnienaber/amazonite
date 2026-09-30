private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLocalGatewayRouteTableRequest
    # The ID of the local gateway.
    property local_gateway_id : String

    # The mode of the local gateway route table.
    property mode : LocalGatewayRouteTableMode | Nil

    # The tags assigned to the local gateway route table.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @local_gateway_id : String,
      @mode : LocalGatewayRouteTableMode | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LocalGatewayId", @local_gateway_id}

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayId']")).not_nil!,
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? AEC::LocalGatewayRouteTableMode.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_id, @mode, @tag_specifications, @dry_run)
  end
end
