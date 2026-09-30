private alias Core = Amazonite::Core

module Amazonite::EC2
  class AttachVerifiedAccessTrustProviderRequest
    # The ID of the Verified Access instance.
    property verified_access_instance_id : String

    # The ID of the Verified Access trust provider.
    property verified_access_trust_provider_id : String

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @verified_access_instance_id : String,
      @verified_access_trust_provider_id : String,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessInstanceId", @verified_access_instance_id}

      params << {"#{prefix}VerifiedAccessTrustProviderId", @verified_access_trust_provider_id}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessInstanceId']")).not_nil!,
        verified_access_trust_provider_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessTrustProviderId']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@verified_access_instance_id, @verified_access_trust_provider_id, @client_token, @dry_run)
  end
end
