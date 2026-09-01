module Amazonite::Sqs
  class ListMessageMoveTasksRequest
    include JSON::Serializable

    # The ARN of the queue whose message movement tasks are to be listed.
    @[JSON::Field(key: "SourceArn")]
    property source_arn : String

    # The maximum number of results to include in the response. The default is 1, which provides the
    # most recent message movement task. The upper limit is 10.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @source_arn : String,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_arn, @max_results)
  end
end
