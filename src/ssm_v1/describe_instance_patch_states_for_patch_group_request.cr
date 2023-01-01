module Amazonite::SsmV1
  class DescribeInstancePatchStatesForPatchGroupRequest
    include JSON::Serializable

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    @[JSON::Field(key: "Filters")]
    property filters : Array(InstancePatchStateFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @patch_group : String,
      @filters : Array(InstancePatchStateFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
