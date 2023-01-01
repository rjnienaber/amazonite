module Amazonite::SsmV1
  class DescribeAvailablePatchesResult
    include JSON::Serializable

    @[JSON::Field(key: "Patches")]
    property patches : Array(Patch) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @patches : Array(Patch) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
