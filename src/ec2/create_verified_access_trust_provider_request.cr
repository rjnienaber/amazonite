private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVerifiedAccessTrustProviderRequest
    # The type of trust provider.
    property trust_provider_type : TrustProviderType

    # The type of user-based trust provider. This parameter is required when the provider type is
    # `user`.
    property user_trust_provider_type : UserTrustProviderType | Nil

    # The type of device-based trust provider. This parameter is required when the provider type is
    # `device`.
    property device_trust_provider_type : DeviceTrustProviderType | Nil

    # The options for a OpenID Connect-compatible user-identity trust provider. This parameter is
    # required when the provider type is `user`.
    property oidc_options : CreateVerifiedAccessTrustProviderOidcOptions | Nil

    # The options for a device-based trust provider. This parameter is required when the provider type
    # is `device`.
    property device_options : CreateVerifiedAccessTrustProviderDeviceOptions | Nil

    # The identifier to be used when working with policy rules.
    property policy_reference_name : String

    # A description for the Verified Access trust provider.
    property description : String | Nil

    # The tags to assign to the Verified Access trust provider.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The options for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationRequest | Nil

    # The OpenID Connect (OIDC) options.
    property native_application_oidc_options : CreateVerifiedAccessNativeApplicationOidcOptions | Nil

    def initialize(
      @trust_provider_type : TrustProviderType,
      @policy_reference_name : String,
      @user_trust_provider_type : UserTrustProviderType | Nil = nil,
      @device_trust_provider_type : DeviceTrustProviderType | Nil = nil,
      @oidc_options : CreateVerifiedAccessTrustProviderOidcOptions | Nil = nil,
      @device_options : CreateVerifiedAccessTrustProviderDeviceOptions | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationRequest | Nil = nil,
      @native_application_oidc_options : CreateVerifiedAccessNativeApplicationOidcOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TrustProviderType", @trust_provider_type.to_json_object_key}

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

      params << {"#{prefix}PolicyReferenceName", @policy_reference_name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
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
        trust_provider_type: ((n = node.xpath_node("*[local-name()='TrustProviderType']")) ? AEC::TrustProviderType.from_json_object_key?(n.content) : nil).not_nil!,
        user_trust_provider_type: (n = node.xpath_node("*[local-name()='UserTrustProviderType']")) ? AEC::UserTrustProviderType.from_json_object_key?(n.content) : nil,
        device_trust_provider_type: (n = node.xpath_node("*[local-name()='DeviceTrustProviderType']")) ? AEC::DeviceTrustProviderType.from_json_object_key?(n.content) : nil,
        oidc_options: node.xpath_node("*[local-name()='OidcOptions']").try { |n| CreateVerifiedAccessTrustProviderOidcOptions.from_xml(n) },
        device_options: node.xpath_node("*[local-name()='DeviceOptions']").try { |n| CreateVerifiedAccessTrustProviderDeviceOptions.from_xml(n) },
        policy_reference_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyReferenceName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        sse_specification: node.xpath_node("*[local-name()='SseSpecification']").try { |n| VerifiedAccessSseSpecificationRequest.from_xml(n) },
        native_application_oidc_options: node.xpath_node("*[local-name()='NativeApplicationOidcOptions']").try { |n| CreateVerifiedAccessNativeApplicationOidcOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @oidc_options
        value.validate!
      end

      if value = @device_options
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @sse_specification
        value.validate!
      end

      if value = @native_application_oidc_options
        value.validate!
      end
    end

    def_equals_and_hash(@trust_provider_type, @user_trust_provider_type, @device_trust_provider_type, @oidc_options, @device_options, @policy_reference_name, @description, @tag_specifications, @client_token, @dry_run, @sse_specification, @native_application_oidc_options)
  end
end
