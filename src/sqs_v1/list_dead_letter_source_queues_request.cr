module Amazonite::SqsV1
  class ListDeadLetterSourceQueuesRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @queue_url : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
