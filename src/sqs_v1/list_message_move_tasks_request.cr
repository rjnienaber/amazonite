module Amazonite::SqsV1
  class ListMessageMoveTasksRequest
    include JSON::Serializable

    @[JSON::Field(key: "SourceArn")]
    property source_arn : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @source_arn : String,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
