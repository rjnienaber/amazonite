private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class ListResourcePoliciesResponse
    include JSON::Serializable

    # A list of the resource policies attached to the secret.
    @[JSON::Field(key: "ResourcePolicies")]
    property resource_policies : Array(ResourcePolicySummary) = [] of ResourcePolicySummary

    # Secrets Manager includes this value if there's more output available than what is included in
    # the current response. To get the next results, call `ListResourcePolicies` again with this
    # value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_policies : Array(ResourcePolicySummary),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_policies
        raise Core::ValidationError.new("ResourcePolicies must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ResourcePolicies must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@resource_policies, @next_token)
  end
end
