private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayRequest
    # The ID of the transit gateway.
    property transit_gateway_id : String

    # The description for the transit gateway.
    property description : String | Nil

    # The options to modify.
    property options : ModifyTransitGatewayOptions | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_id : String,
      @description : String | Nil = nil,
      @options : ModifyTransitGatewayOptions | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayId", @transit_gateway_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        options: node.xpath_node("*[local-name()='Options']").try { |n| ModifyTransitGatewayOptions.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_id, @description, @options, @dry_run)
  end
end
