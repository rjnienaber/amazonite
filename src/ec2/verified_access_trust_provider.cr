private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Verified Access trust provider.
  class VerifiedAccessTrustProvider
    # The ID of the Amazon Web Services Verified Access trust provider.
    property verified_access_trust_provider_id : String | Nil

    # A description for the Amazon Web Services Verified Access trust provider.
    property description : String | Nil

    # The type of Verified Access trust provider.
    property trust_provider_type : TrustProviderType | Nil

    # The type of user-based trust provider.
    property user_trust_provider_type : UserTrustProviderType | Nil

    # The type of device-based trust provider.
    property device_trust_provider_type : DeviceTrustProviderType | Nil

    # The options for an OpenID Connect-compatible user-identity trust provider.
    property oidc_options : OidcOptions | Nil

    # The options for device-identity trust provider.
    property device_options : DeviceOptions | Nil

    # The identifier to be used when working with policy rules.
    property policy_reference_name : String | Nil

    # The creation time.
    property creation_time : String | Nil

    # The last updated time.
    property last_updated_time : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The options in use for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationResponse | Nil

    # The OpenID Connect (OIDC) options.
    property native_application_oidc_options : NativeApplicationOidcOptions | Nil

    def initialize(
      @verified_access_trust_provider_id : String | Nil = nil,
      @description : String | Nil = nil,
      @trust_provider_type : TrustProviderType | Nil = nil,
      @user_trust_provider_type : UserTrustProviderType | Nil = nil,
      @device_trust_provider_type : DeviceTrustProviderType | Nil = nil,
      @oidc_options : OidcOptions | Nil = nil,
      @device_options : DeviceOptions | Nil = nil,
      @policy_reference_name : String | Nil = nil,
      @creation_time : String | Nil = nil,
      @last_updated_time : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationResponse | Nil = nil,
      @native_application_oidc_options : NativeApplicationOidcOptions | Nil = nil,
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

      if value = @oidc_options
        params.concat(value.to_query_params("#{prefix}OidcOptions."))
      end

      if value = @device_options
        params.concat(value.to_query_params("#{prefix}DeviceOptions."))
      end

      if value = @policy_reference_name
        params << {"#{prefix}PolicyReferenceName", value}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @sse_specification
        params.concat(value.to_query_params("#{prefix}SseSpecification."))
      end

      if value = @native_application_oidc_options
        params.concat(value.to_query_params("#{prefix}NativeApplicationOidcOptions."))
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
        oidc_options: node.xpath_node("*[local-name()='oidcOptions']").try { |n| OidcOptions.from_xml(n) },
        device_options: node.xpath_node("*[local-name()='deviceOptions']").try { |n| DeviceOptions.from_xml(n) },
        policy_reference_name: Core::XMLValue.string(node.xpath_node("*[local-name()='policyReferenceName']")),
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
        last_updated_time: Core::XMLValue.string(node.xpath_node("*[local-name()='lastUpdatedTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        sse_specification: node.xpath_node("*[local-name()='sseSpecification']").try { |n| VerifiedAccessSseSpecificationResponse.from_xml(n) },
        native_application_oidc_options: node.xpath_node("*[local-name()='nativeApplicationOidcOptions']").try { |n| NativeApplicationOidcOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @oidc_options
        value.validate!
      end

      if value = @device_options
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @sse_specification
        value.validate!
      end

      if value = @native_application_oidc_options
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_trust_provider_id, @description, @trust_provider_type, @user_trust_provider_type, @device_trust_provider_type, @oidc_options, @device_options, @policy_reference_name, @creation_time, @last_updated_time, @tags, @sse_specification, @native_application_oidc_options)
  end
end
