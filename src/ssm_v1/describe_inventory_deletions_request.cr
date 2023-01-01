module Amazonite::SsmV1
  class DescribeInventoryDeletionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
