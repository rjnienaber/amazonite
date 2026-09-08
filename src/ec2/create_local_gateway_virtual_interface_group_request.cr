private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLocalGatewayVirtualInterfaceGroupRequest
    # The ID of the local gateway.
    property local_gateway_id : String

    # The Autonomous System Number(ASN) for the local Border Gateway Protocol (BGP).
    property local_bgp_asn : Int32 | Nil

    # The extended 32-bit ASN for the local BGP configuration.
    property local_bgp_asn_extended : Int64 | Nil

    # The tags to apply to the local gateway virtual interface group when the resource is being
    # created.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @local_gateway_id : String,
      @local_bgp_asn : Int32 | Nil = nil,
      @local_bgp_asn_extended : Int64 | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LocalGatewayId", @local_gateway_id}

      if value = @local_bgp_asn
        params << {"#{prefix}LocalBgpAsn", value.to_s}
      end

      if value = @local_bgp_asn_extended
        params << {"#{prefix}LocalBgpAsnExtended", value.to_s}
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
        local_bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='LocalBgpAsn']")),
        local_bgp_asn_extended: Core::XMLValue.i64(node.xpath_node("*[local-name()='LocalBgpAsnExtended']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_id, @local_bgp_asn, @local_bgp_asn_extended, @tag_specifications, @dry_run)
  end
end
