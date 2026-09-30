private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetResourcePoliciesResponse
    include JSON::Serializable

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # An array of the `Policy` object.
    @[JSON::Field(key: "Policies")]
    property policies : Array(GetResourcePoliciesResponseEntry) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @policies : Array(GetResourcePoliciesResponseEntry) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @policies)
  end
end
