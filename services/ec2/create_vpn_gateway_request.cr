private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateVpnGateway.
  class CreateVpnGatewayRequest
    # The Availability Zone for the virtual private gateway.
    property availability_zone : String | Nil

    # The type of VPN connection this virtual private gateway supports.
    property type : GatewayType

    # The tags to apply to the virtual private gateway.
    property tag_specifications : Array(TagSpecification) | Nil

    # A private Autonomous System Number (ASN) for the Amazon side of a BGP session. If you're using a
    # 16-bit ASN, it must be in the 64512 to 65534 range. If you're using a 32-bit ASN, it must be in
    # the 4200000000 to 4294967294 range.
    #
    # Default: 64512
    property amazon_side_asn : Int64 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @type : GatewayType,
      @availability_zone : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @amazon_side_asn : Int64 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      params << {"#{prefix}Type", @type.to_json_object_key}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        type: ((n = node.xpath_node("*[local-name()='Type']")) ? AEC::GatewayType.from_json_object_key?(n.content) : nil).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='AmazonSideAsn']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zone, @type, @tag_specifications, @amazon_side_asn, @dry_run)
  end
end
