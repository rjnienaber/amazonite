private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a device trust provider to configure for a Client VPN endpoint.
  class ClientVpnTrustProviderRequest
    # The type of the device trust provider. Possible values include:
    #
    # - `crowdstrike` - CrowdStrike device trust provider.
    #
    # - `jamf` - Jamf device trust provider.
    #
    # - `jumpcloud` - JumpCloud device trust provider.
    property trust_provider_type : ClientVpnDeviceTrustProviderType | Nil

    # The tenant ID associated with your device trust provider account.
    property tenant_id : String | Nil

    # The URL of the public signing key that is used to verify the identity token issued by the device
    # trust provider.
    property public_signing_key_url : String | Nil

    def initialize(
      @trust_provider_type : ClientVpnDeviceTrustProviderType | Nil = nil,
      @tenant_id : String | Nil = nil,
      @public_signing_key_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @trust_provider_type
        params << {"#{prefix}TrustProviderType", value.to_json_object_key}
      end

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
        trust_provider_type: (n = node.xpath_node("*[local-name()='TrustProviderType']")) ? AEC::ClientVpnDeviceTrustProviderType.from_json_object_key?(n.content) : nil,
        tenant_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TenantId']")),
        public_signing_key_url: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicSigningKeyUrl']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@trust_provider_type, @tenant_id, @public_signing_key_url)
  end
end
