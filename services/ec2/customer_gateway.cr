private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a customer gateway.
  class CustomerGateway
    # The Amazon Resource Name (ARN) for the customer gateway certificate.
    property certificate_arn : String | Nil

    # The name of customer gateway device.
    property device_name : String | Nil

    # Any tags assigned to the customer gateway.
    property tags : Array(Tag) | Nil

    # The customer gateway device's Border Gateway Protocol (BGP) Autonomous System Number (ASN).
    #
    # Valid values: `2,147,483,648` to `4,294,967,295`
    property bgp_asn_extended : String | Nil

    # The ID of the customer gateway.
    property customer_gateway_id : String | Nil

    # The current state of the customer gateway (`pending | available | deleting | deleted`).
    property state : String | Nil

    # The type of VPN connection the customer gateway supports (`ipsec.1`).
    property type : String | Nil

    # The IP address for the customer gateway device's outside interface. The address must be static.
    # If `OutsideIpAddressType` in your VPN connection options is set to `PrivateIpv4`, you can use an
    # RFC6598 or RFC1918 private IPv4 address. If `OutsideIpAddressType` is set to `PublicIpv4`, you
    # can use a public IPv4 address. If `OutsideIpAddressType` is set to `Ipv6`, you can use a public
    # IPv6 address.
    property ip_address : String | Nil

    # The customer gateway device's Border Gateway Protocol (BGP) Autonomous System Number (ASN).
    #
    # Valid values: `1` to `2,147,483,647`
    property bgp_asn : String | Nil

    def initialize(
      @certificate_arn : String | Nil = nil,
      @device_name : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @bgp_asn_extended : String | Nil = nil,
      @customer_gateway_id : String | Nil = nil,
      @state : String | Nil = nil,
      @type : String | Nil = nil,
      @ip_address : String | Nil = nil,
      @bgp_asn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @certificate_arn
        params << {"#{prefix}CertificateArn", value}
      end

      if value = @device_name
        params << {"#{prefix}DeviceName", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @bgp_asn_extended
        params << {"#{prefix}BgpAsnExtended", value}
      end

      if value = @customer_gateway_id
        params << {"#{prefix}CustomerGatewayId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @ip_address
        params << {"#{prefix}IpAddress", value}
      end

      if value = @bgp_asn
        params << {"#{prefix}BgpAsn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateArn']")),
        device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='deviceName']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        bgp_asn_extended: Core::XMLValue.string(node.xpath_node("*[local-name()='bgpAsnExtended']")),
        customer_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='customerGatewayId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipAddress']")),
        bgp_asn: Core::XMLValue.string(node.xpath_node("*[local-name()='bgpAsn']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@certificate_arn, @device_name, @tags, @bgp_asn_extended, @customer_gateway_id, @state, @type, @ip_address, @bgp_asn)
  end
end
