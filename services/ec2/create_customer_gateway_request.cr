private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateCustomerGateway.
  class CreateCustomerGatewayRequest
    # For customer gateway devices that support BGP, specify the device's ASN. You must specify either
    # `BgpAsn` or `BgpAsnExtended` when creating the customer gateway. If the ASN is larger than
    # `2,147,483,647`, you must use `BgpAsnExtended`.
    #
    # Default: 65000
    #
    # Valid values: `1` to `2,147,483,647`
    property bgp_asn : Int32 | Nil

    # *This member has been deprecated.* The Internet-routable IP address for the customer gateway's
    # outside interface. The address must be static.
    property public_ip : String | Nil

    # The Amazon Resource Name (ARN) for the customer gateway certificate.
    property certificate_arn : String | Nil

    # The type of VPN connection that this customer gateway supports (`ipsec.1`).
    property type : GatewayType

    # The tags to apply to the customer gateway.
    property tag_specifications : Array(TagSpecification) | Nil

    # A name for the customer gateway device.
    #
    # Length Constraints: Up to 255 characters.
    property device_name : String | Nil

    # The IP address for the customer gateway device's outside interface. The address must be static.
    # If `OutsideIpAddressType` in your VPN connection options is set to `PrivateIpv4`, you can use an
    # RFC6598 or RFC1918 private IPv4 address. If `OutsideIpAddressType` is set to `Ipv6`, you can use
    # an IPv6 address.
    property ip_address : String | Nil

    # For customer gateway devices that support BGP, specify the device's ASN. You must specify either
    # `BgpAsn` or `BgpAsnExtended` when creating the customer gateway. If the ASN is larger than
    # `2,147,483,647`, you must use `BgpAsnExtended`.
    #
    # Valid values: `2,147,483,648` to `4,294,967,295`
    property bgp_asn_extended : Int64 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @type : GatewayType,
      @bgp_asn : Int32 | Nil = nil,
      @public_ip : String | Nil = nil,
      @certificate_arn : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @device_name : String | Nil = nil,
      @ip_address : String | Nil = nil,
      @bgp_asn_extended : Int64 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @bgp_asn
        params << {"#{prefix}BgpAsn", value.to_s}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @certificate_arn
        params << {"#{prefix}CertificateArn", value}
      end

      params << {"#{prefix}Type", @type.to_json_object_key}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      if value = @ip_address
        params << {"#{prefix}IpAddress", value}
      end

      if value = @bgp_asn_extended
        params << {"#{prefix}BgpAsnExtended", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bgp_asn: Core::XMLValue.i32(node.xpath_node("*[local-name()='BgpAsn']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIp']")),
        certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateArn']")),
        type: ((n = node.xpath_node("*[local-name()='Type']")) ? AEC::GatewayType.from_json_object_key?(n.content) : nil).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DeviceName']")),
        ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='IpAddress']")),
        bgp_asn_extended: Core::XMLValue.i64(node.xpath_node("*[local-name()='BgpAsnExtended']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bgp_asn, @public_ip, @certificate_arn, @type, @tag_specifications, @device_name, @ip_address, @bgp_asn_extended, @dry_run)
  end
end
