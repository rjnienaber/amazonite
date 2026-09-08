private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the targets for the specified Verified Access endpoint.
  class VerifiedAccessEndpointTarget
    # The ID of the Verified Access endpoint.
    property verified_access_endpoint_id : String | Nil

    # The IP address of the target.
    property verified_access_endpoint_target_ip_address : String | Nil

    # The DNS name of the target.
    property verified_access_endpoint_target_dns : String | Nil

    def initialize(
      @verified_access_endpoint_id : String | Nil = nil,
      @verified_access_endpoint_target_ip_address : String | Nil = nil,
      @verified_access_endpoint_target_dns : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_endpoint_id
        params << {"#{prefix}VerifiedAccessEndpointId", value}
      end

      if value = @verified_access_endpoint_target_ip_address
        params << {"#{prefix}VerifiedAccessEndpointTargetIpAddress", value}
      end

      if value = @verified_access_endpoint_target_dns
        params << {"#{prefix}VerifiedAccessEndpointTargetDns", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessEndpointId']")),
        verified_access_endpoint_target_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessEndpointTargetIpAddress']")),
        verified_access_endpoint_target_dns: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessEndpointTargetDns']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@verified_access_endpoint_id, @verified_access_endpoint_target_ip_address, @verified_access_endpoint_target_dns)
  end
end
