private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyNetworkingFlexCostAllocationPolicyResult
    # The ID of the flex cost allocation policy.
    property fca_policy_id : String | Nil

    # The date and time when the policy was updated.
    property updated_at : Time | Nil

    # The version number of the policy that this modification created.
    property version : Int32 | Nil

    # The date and time when the new version of the policy is expected to apply to network traffic.
    property version_expected_effective_at : Time | Nil

    def initialize(
      @fca_policy_id : String | Nil = nil,
      @updated_at : Time | Nil = nil,
      @version : Int32 | Nil = nil,
      @version_expected_effective_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fca_policy_id
        params << {"#{prefix}FcaPolicyId", value}
      end

      if value = @updated_at
        params << {"#{prefix}UpdatedAt", Core::QueryValue.time(value)}
      end

      if value = @version
        params << {"#{prefix}Version", value.to_s}
      end

      if value = @version_expected_effective_at
        params << {"#{prefix}VersionExpectedEffectiveAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyId']")),
        updated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updatedAt']")),
        version: Core::XMLValue.i32(node.xpath_node("*[local-name()='version']")),
        version_expected_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='versionExpectedEffectiveAt']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end

      if value = @version
        raise Core::ValidationError.new("Version value must be >= 1") if value < 1
        raise Core::ValidationError.new("Version value must be <= 2147483647") if value > 2147483647
      end
    end

    def_equals_and_hash(@fca_policy_id, @updated_at, @version, @version_expected_effective_at)
  end
end
