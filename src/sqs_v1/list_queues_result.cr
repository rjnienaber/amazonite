module Amazonite::SqsV1
  class ListQueuesResult
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrls")]
    property queue_urls : Array(String) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @queue_urls : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
