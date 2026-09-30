private alias Core = Amazonite::Core

module Amazonite::EC2
  # Public hostname type options. For more information, see [EC2 instance hostnames, DNS names, and
  # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
  # *Amazon EC2 User Guide*.
  class PublicIpDnsNameOptions
    # The public hostname type. For more information, see [EC2 instance hostnames, DNS names, and
    # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
    # *Amazon EC2 User Guide*.
    property dns_hostname_type : String | Nil

    # An IPv4-enabled public hostname for a network interface. Requests from within the VPC resolve to
    # the private primary IPv4 address of the network interface. Requests from the internet resolve to
    # the public IPv4 address of the network interface.
    property public_ipv_4_dns_name : String | Nil

    # An IPv6-enabled public hostname for a network interface. Requests from within the VPC or from
    # the internet resolve to the IPv6 GUA of the network interface.
    property public_ipv_6_dns_name : String | Nil

    # A dual-stack public hostname for a network interface. Requests from within the VPC resolve to
    # both the private IPv4 address and the IPv6 Global Unicast Address of the network interface.
    # Requests from the internet resolve to both the public IPv4 and the IPv6 GUA address of the
    # network interface.
    property public_dual_stack_dns_name : String | Nil

    def initialize(
      @dns_hostname_type : String | Nil = nil,
      @public_ipv_4_dns_name : String | Nil = nil,
      @public_ipv_6_dns_name : String | Nil = nil,
      @public_dual_stack_dns_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dns_hostname_type
        params << {"#{prefix}DnsHostnameType", value}
      end

      if value = @public_ipv_4_dns_name
        params << {"#{prefix}PublicIpv4DnsName", value}
      end

      if value = @public_ipv_6_dns_name
        params << {"#{prefix}PublicIpv6DnsName", value}
      end

      if value = @public_dual_stack_dns_name
        params << {"#{prefix}PublicDualStackDnsName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dns_hostname_type: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsHostnameType']")),
        public_ipv_4_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv4DnsName']")),
        public_ipv_6_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv6DnsName']")),
        public_dual_stack_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicDualStackDnsName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dns_hostname_type, @public_ipv_4_dns_name, @public_ipv_6_dns_name, @public_dual_stack_dns_name)
  end
end
