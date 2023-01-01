module Amazonite::SsmV1
  class DescribeInstancePatchesResult
    include JSON::Serializable

    @[JSON::Field(key: "Patches")]
    property patches : Array(PatchComplianceData) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @patches : Array(PatchComplianceData) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
