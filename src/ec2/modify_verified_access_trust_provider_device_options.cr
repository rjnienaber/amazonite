private alias Core = Amazonite::Core

module Amazonite::EC2
  # Modifies the configuration of the specified device-based Amazon Web Services Verified Access
  # trust provider.
  class ModifyVerifiedAccessTrustProviderDeviceOptions
    # The URL Amazon Web Services Verified Access will use to verify the authenticity of the device
    # tokens.
    property public_signing_key_url : String | Nil

    def initialize(
      @public_signing_key_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_signing_key_url
        params << {"#{prefix}PublicSigningKeyUrl", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_signing_key_url: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicSigningKeyUrl']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@public_signing_key_url)
  end
end
