module Amazonite::SsmV1
  class GetResourcePoliciesResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Policies")]
    property policies : Array(GetResourcePoliciesResponseEntry) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @policies : Array(GetResourcePoliciesResponseEntry) | Nil = nil,
    )
    end
  end
end
