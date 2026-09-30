private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateVpnConnection.
  class CreateVpnConnectionRequest
    # The ID of the customer gateway.
    property customer_gateway_id : String

    # The type of VPN connection (`ipsec.1`).
    property type : String

    # The ID of the virtual private gateway. If you specify a virtual private gateway, you cannot
    # specify a transit gateway.
    property vpn_gateway_id : String | Nil

    # The ID of the transit gateway. If you specify a transit gateway, you cannot specify a virtual
    # private gateway.
    property transit_gateway_id : String | Nil

    # The ID of the VPN concentrator to associate with the VPN connection.
    property vpn_concentrator_id : String | Nil

    # The tags to apply to the VPN connection.
    property tag_specifications : Array(TagSpecification) | Nil

    # Specifies the storage mode for the pre-shared key (PSK). Valid values are `Standard`" (stored in
    # the Site-to-Site VPN service) or `SecretsManager` (stored in Amazon Web Services Secrets
    # Manager).
    property pre_shared_key_storage : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The options for the VPN connection.
    property options : VpnConnectionOptionsSpecification | Nil

    def initialize(
      @customer_gateway_id : String,
      @type : String,
      @vpn_gateway_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @vpn_concentrator_id : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @pre_shared_key_storage : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @options : VpnConnectionOptionsSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CustomerGatewayId", @customer_gateway_id}

      params << {"#{prefix}Type", @type}

      if value = @vpn_gateway_id
        params << {"#{prefix}VpnGatewayId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @vpn_concentrator_id
        params << {"#{prefix}VpnConcentratorId", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @pre_shared_key_storage
        params << {"#{prefix}PreSharedKeyStorage", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        customer_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomerGatewayId']")).not_nil!,
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='Type']")).not_nil!,
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnGatewayId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")),
        vpn_concentrator_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConcentratorId']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        pre_shared_key_storage: Core::XMLValue.string(node.xpath_node("*[local-name()='PreSharedKeyStorage']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        options: node.xpath_node("*[local-name()='options']").try { |n| VpnConnectionOptionsSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @options
        value.validate!
      end
    end

    def_equals_and_hash(@customer_gateway_id, @type, @vpn_gateway_id, @transit_gateway_id, @vpn_concentrator_id, @tag_specifications, @pre_shared_key_storage, @dry_run, @options)
  end
end
