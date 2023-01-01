module Amazonite::SsmV1
  class DescribeEffectivePatchesForPatchBaselineRequest
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @baseline_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
