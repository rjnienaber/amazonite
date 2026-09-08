private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a DNS entry.
  class DnsEntry
    # The DNS name.
    property dns_name : String | Nil

    # The ID of the private hosted zone.
    property hosted_zone_id : String | Nil

    def initialize(
      @dns_name : String | Nil = nil,
      @hosted_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dns_name
        params << {"#{prefix}DnsName", value}
      end

      if value = @hosted_zone_id
        params << {"#{prefix}HostedZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
        hosted_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostedZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dns_name, @hosted_zone_id)
  end
end
