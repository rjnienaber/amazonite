private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessTrustProviderRequest
    # The ID of the Verified Access trust provider.
    property verified_access_trust_provider_id : String

    # The options for an OpenID Connect-compatible user-identity trust provider.
    property oidc_options : ModifyVerifiedAccessTrustProviderOidcOptions | Nil

    # The options for a device-based trust provider. This parameter is required when the provider type
    # is `device`.
    property device_options : ModifyVerifiedAccessTrustProviderDeviceOptions | Nil

    # A description for the Verified Access trust provider.
    property description : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The options for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationRequest | Nil

    # The OpenID Connect (OIDC) options.
    property native_application_oidc_options : ModifyVerifiedAccessNativeApplicationOidcOptions | Nil

    def initialize(
      @verified_access_trust_provider_id : String,
      @oidc_options : ModifyVerifiedAccessTrustProviderOidcOptions | Nil = nil,
      @device_options : ModifyVerifiedAccessTrustProviderDeviceOptions | Nil = nil,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationRequest | Nil = nil,
      @native_application_oidc_options : ModifyVerifiedAccessNativeApplicationOidcOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessTrustProviderId", @verified_access_trust_provider_id}

      if value = @oidc_options
        params.concat(value.to_query_params("#{prefix}OidcOptions."))
      end

      if value = @device_options
        params.concat(value.to_query_params("#{prefix}DeviceOptions."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
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
        verified_access_trust_provider_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessTrustProviderId']")).not_nil!,
        oidc_options: node.xpath_node("*[local-name()='OidcOptions']").try { |n| ModifyVerifiedAccessTrustProviderOidcOptions.from_xml(n) },
        device_options: node.xpath_node("*[local-name()='DeviceOptions']").try { |n| ModifyVerifiedAccessTrustProviderDeviceOptions.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        sse_specification: node.xpath_node("*[local-name()='SseSpecification']").try { |n| VerifiedAccessSseSpecificationRequest.from_xml(n) },
        native_application_oidc_options: node.xpath_node("*[local-name()='NativeApplicationOidcOptions']").try { |n| ModifyVerifiedAccessNativeApplicationOidcOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @oidc_options
        value.validate!
      end

      if value = @device_options
        value.validate!
      end

      if value = @sse_specification
        value.validate!
      end

      if value = @native_application_oidc_options
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_trust_provider_id, @oidc_options, @device_options, @description, @dry_run, @client_token, @sse_specification, @native_application_oidc_options)
  end
end
