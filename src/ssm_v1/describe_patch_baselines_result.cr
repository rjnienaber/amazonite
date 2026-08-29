module Amazonite::SsmV1
  class DescribePatchBaselinesResult
    include JSON::Serializable

    # An array of `PatchBaselineIdentity` elements.
    @[JSON::Field(key: "BaselineIdentities")]
    property baseline_identities : Array(PatchBaselineIdentity) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @baseline_identities : Array(PatchBaselineIdentity) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
