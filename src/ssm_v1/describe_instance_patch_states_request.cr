module Amazonite::SsmV1
  class DescribeInstancePatchStatesRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String)

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @instance_ids : Array(String),
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
