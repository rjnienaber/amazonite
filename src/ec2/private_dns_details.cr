private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the Private DNS name for interface endpoints.
  class PrivateDnsDetails
    # The private DNS name assigned to the VPC endpoint service.
    property private_dns_name : String | Nil

    def initialize(
      @private_dns_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@private_dns_name)
  end
end
