module Amazonite::SsmV1
  class DescribePatchBaselinesResult
    include JSON::Serializable

    @[JSON::Field(key: "BaselineIdentities")]
    property baseline_identities : Array(PatchBaselineIdentity) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @baseline_identities : Array(PatchBaselineIdentity) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
