private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options when creating an Amazon Web Services Verified Access trust provider using
  # the `device` type.
  class CreateVerifiedAccessTrustProviderDeviceOptions
    # The ID of the tenant application with the device-identity provider.
    property tenant_id : String | Nil

    # The URL Amazon Web Services Verified Access will use to verify the authenticity of the device
    # tokens.
    property public_signing_key_url : String | Nil

    def initialize(
      @tenant_id : String | Nil = nil,
      @public_signing_key_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @tenant_id
        params << {"#{prefix}TenantId", value}
      end

      if value = @public_signing_key_url
        params << {"#{prefix}PublicSigningKeyUrl", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tenant_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TenantId']")),
        public_signing_key_url: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicSigningKeyUrl']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@tenant_id, @public_signing_key_url)
  end
end
