private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkingFlexCostAllocationPolicyResult
    # The ID of the flex cost allocation policy.
    property fca_policy_id : String | Nil

    # The Amazon Resource Name (ARN) of the flex cost allocation policy.
    property fca_policy_arn : String | Nil

    # The date and time when the policy was created.
    property created_at : Time | Nil

    # The date and time when the policy is expected to apply to network traffic.
    property expected_effective_at : Time | Nil

    def initialize(
      @fca_policy_id : String | Nil = nil,
      @fca_policy_arn : String | Nil = nil,
      @created_at : Time | Nil = nil,
      @expected_effective_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fca_policy_id
        params << {"#{prefix}FcaPolicyId", value}
      end

      if value = @fca_policy_arn
        params << {"#{prefix}FcaPolicyArn", value}
      end

      if value = @created_at
        params << {"#{prefix}CreatedAt", Core::QueryValue.time(value)}
      end

      if value = @expected_effective_at
        params << {"#{prefix}ExpectedEffectiveAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyId']")),
        fca_policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyArn']")),
        created_at: Core::XMLValue.time(node.xpath_node("*[local-name()='createdAt']")),
        expected_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='expectedEffectiveAt']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end

      if value = @fca_policy_arn
        raise Core::ValidationError.new("FcaPolicyArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FcaPolicyArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@fca_policy_id, @fca_policy_arn, @created_at, @expected_effective_at)
  end
end
