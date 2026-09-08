private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamExternalResourceVerificationTokenResult
    # The verification token.
    property ipam_external_resource_verification_token : IpamExternalResourceVerificationToken | Nil

    def initialize(
      @ipam_external_resource_verification_token : IpamExternalResourceVerificationToken | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_external_resource_verification_token
        params.concat(value.to_query_params("#{prefix}IpamExternalResourceVerificationToken."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_external_resource_verification_token: node.xpath_node("*[local-name()='ipamExternalResourceVerificationToken']").try { |n| IpamExternalResourceVerificationToken.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_external_resource_verification_token
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_external_resource_verification_token)
  end
end
