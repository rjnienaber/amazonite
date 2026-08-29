module Amazonite::SqsV1
  class ListQueuesRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueNamePrefix")]
    property queue_name_prefix : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @queue_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
