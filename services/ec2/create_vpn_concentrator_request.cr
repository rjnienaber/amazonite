private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpnConcentratorRequest
    # The type of VPN concentrator to create.
    property type : VpnConcentratorType

    # The ID of the transit gateway to attach the VPN concentrator to.
    property transit_gateway_id : String | Nil

    # The tags to apply to the VPN concentrator during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @type : VpnConcentratorType,
      @transit_gateway_id : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Type", @type.to_json_object_key}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
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
        type: ((n = node.xpath_node("*[local-name()='Type']")) ? AEC::VpnConcentratorType.from_json_object_key?(n.content) : nil).not_nil!,
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@type, @transit_gateway_id, @tag_specifications, @dry_run)
  end
end
