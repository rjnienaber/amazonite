module Amazonite::SsmV1
  class DescribePatchGroupsResult
    include JSON::Serializable

    @[JSON::Field(key: "Mappings")]
    property mappings : Array(PatchGroupPatchBaselineMapping) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @mappings : Array(PatchGroupPatchBaselineMapping) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
