private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVerifiedAccessGroupPolicyResult
    # The status of the Verified Access policy.
    property policy_enabled : Bool | Nil

    # The Verified Access policy document.
    property policy_document : String | Nil

    # The options in use for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationResponse | Nil

    def initialize(
      @policy_enabled : Bool | Nil = nil,
      @policy_document : String | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_enabled
        params << {"#{prefix}PolicyEnabled", Core::QueryValue.bool(value)}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      if value = @sse_specification
        params.concat(value.to_query_params("#{prefix}SseSpecification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='policyEnabled']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='policyDocument']")),
        sse_specification: node.xpath_node("*[local-name()='sseSpecification']").try { |n| VerifiedAccessSseSpecificationResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @sse_specification
        value.validate!
      end
    end

    def_equals_and_hash(@policy_enabled, @policy_document, @sse_specification)
  end
end
