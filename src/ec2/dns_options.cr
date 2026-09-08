private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the DNS options for an endpoint.
  class DnsOptions
    # The DNS records created for the endpoint.
    property dns_record_ip_type : DnsRecordIpType | Nil

    # Indicates whether to enable private DNS only for inbound endpoints.
    property private_dns_only_for_inbound_resolver_endpoint : Bool | Nil

    # The preference for which private domains have a private hosted zone created for and associated
    # with the specified VPC. Only supported when private DNS is enabled and when the VPC endpoint
    # type is ServiceNetwork or Resource.
    #
    # - `ALL_DOMAINS` - VPC Lattice provisions private hosted zones for all custom domain names.
    #
    # - `VERIFIED_DOMAINS_ONLY` - VPC Lattice provisions a private hosted zone only if custom domain
    # name has been verified by the provider.
    #
    # - `VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS` - VPC Lattice provisions private hosted zones for all
    # verified custom domain names and other domain names that the resource consumer specifies. The
    # resource consumer specifies the domain names in the PrivateDnsSpecifiedDomains parameter.
    #
    # - `SPECIFIED_DOMAINS_ONLY` - VPC Lattice provisions a private hosted zone for domain names
    # specified by the resource consumer. The resource consumer specifies the domain names in the
    # PrivateDnsSpecifiedDomains parameter.
    property private_dns_preference : String | Nil

    # Indicates which of the private domains to create private hosted zones for and associate with the
    # specified VPC. Only supported when private DNS is enabled and the private DNS preference is
    # `VERIFIED_DOMAINS_AND_SPECIFIED_DOMAINS` or `SPECIFIED_DOMAINS_ONLY`.
    property private_dns_specified_domains : Array(String) | Nil

    def initialize(
      @dns_record_ip_type : DnsRecordIpType | Nil = nil,
      @private_dns_only_for_inbound_resolver_endpoint : Bool | Nil = nil,
      @private_dns_preference : String | Nil = nil,
      @private_dns_specified_domains : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dns_record_ip_type
        params << {"#{prefix}DnsRecordIpType", value.to_json_object_key}
      end

      if value = @private_dns_only_for_inbound_resolver_endpoint
        params << {"#{prefix}PrivateDnsOnlyForInboundResolverEndpoint", Core::QueryValue.bool(value)}
      end

      if value = @private_dns_preference
        params << {"#{prefix}PrivateDnsPreference", value}
      end

      (@private_dns_specified_domains || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateDnsSpecifiedDomainSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dns_record_ip_type: (n = node.xpath_node("*[local-name()='dnsRecordIpType']")) ? AEC::DnsRecordIpType.from_json_object_key?(n.content) : nil,
        private_dns_only_for_inbound_resolver_endpoint: Core::XMLValue.bool(node.xpath_node("*[local-name()='privateDnsOnlyForInboundResolverEndpoint']")),
        private_dns_preference: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsPreference']")),
        private_dns_specified_domains: node.xpath_nodes("*[local-name()='privateDnsSpecifiedDomainSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @private_dns_specified_domains
        raise Core::ValidationError.new("PrivateDnsSpecifiedDomains must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PrivateDnsSpecifiedDomains must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@dns_record_ip_type, @private_dns_only_for_inbound_resolver_endpoint, @private_dns_preference, @private_dns_specified_domains)
  end
end
