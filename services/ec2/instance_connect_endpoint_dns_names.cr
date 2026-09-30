private alias Core = Amazonite::Core

module Amazonite::EC2
  # The DNS names of the endpoint.
  class InstanceConnectEndpointDnsNames
    # The DNS name of the EC2 Instance Connect Endpoint.
    property dns_name : String | Nil

    # The Federal Information Processing Standards (FIPS) compliant DNS name of the EC2 Instance
    # Connect Endpoint.
    property fips_dns_name : String | Nil

    def initialize(
      @dns_name : String | Nil = nil,
      @fips_dns_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dns_name
        params << {"#{prefix}DnsName", value}
      end

      if value = @fips_dns_name
        params << {"#{prefix}FipsDnsName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
        fips_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='fipsDnsName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dns_name, @fips_dns_name)
  end
end
