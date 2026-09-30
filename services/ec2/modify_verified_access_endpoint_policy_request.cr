private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessEndpointPolicyRequest
    # The ID of the Verified Access endpoint.
    property verified_access_endpoint_id : String

    # The status of the Verified Access policy.
    property policy_enabled : Bool | Nil

    # The Verified Access policy document.
    property policy_document : String | Nil

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

    def initialize(
      @verified_access_endpoint_id : String,
      @policy_enabled : Bool | Nil = nil,
      @policy_document : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessEndpointId", @verified_access_endpoint_id}

      if value = @policy_enabled
        params << {"#{prefix}PolicyEnabled", Core::QueryValue.bool(value)}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessEndpointId']")).not_nil!,
        policy_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='PolicyEnabled']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        sse_specification: node.xpath_node("*[local-name()='SseSpecification']").try { |n| VerifiedAccessSseSpecificationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @sse_specification
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_endpoint_id, @policy_enabled, @policy_document, @client_token, @dry_run, @sse_specification)
  end
end
