private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Condensed information about a trust provider.
  class VerifiedAccessTrustProviderCondensed
    # The ID of the trust provider.
    property verified_access_trust_provider_id : String | Nil

    # The description of trust provider.
    property description : String | Nil

    # The type of trust provider (user- or device-based).
    property trust_provider_type : TrustProviderType | Nil

    # The type of user-based trust provider.
    property user_trust_provider_type : UserTrustProviderType | Nil

    # The type of device-based trust provider.
    property device_trust_provider_type : DeviceTrustProviderType | Nil

    def initialize(
      @verified_access_trust_provider_id : String | Nil = nil,
      @description : String | Nil = nil,
      @trust_provider_type : TrustProviderType | Nil = nil,
      @user_trust_provider_type : UserTrustProviderType | Nil = nil,
      @device_trust_provider_type : DeviceTrustProviderType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_trust_provider_id
        params << {"#{prefix}VerifiedAccessTrustProviderId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @trust_provider_type
        params << {"#{prefix}TrustProviderType", value.to_json_object_key}
      end

      if value = @user_trust_provider_type
        params << {"#{prefix}UserTrustProviderType", value.to_json_object_key}
      end

      if value = @device_trust_provider_type
        params << {"#{prefix}DeviceTrustProviderType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_trust_provider_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessTrustProviderId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        trust_provider_type: (n = node.xpath_node("*[local-name()='trustProviderType']")) ? AEC::TrustProviderType.from_json_object_key?(n.content) : nil,
        user_trust_provider_type: (n = node.xpath_node("*[local-name()='userTrustProviderType']")) ? AEC::UserTrustProviderType.from_json_object_key?(n.content) : nil,
        device_trust_provider_type: (n = node.xpath_node("*[local-name()='deviceTrustProviderType']")) ? AEC::DeviceTrustProviderType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@verified_access_trust_provider_id, @description, @trust_provider_type, @user_trust_provider_type, @device_trust_provider_type)
  end
end
