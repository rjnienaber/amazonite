module Amazonite::SqsV1
  class ListDeadLetterSourceQueuesResult
    include JSON::Serializable

    @[JSON::Field(key: "queueUrls")]
    property queue_urls : Array(String) = [] of String

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @queue_urls : Array(String),
      @next_token : String | Nil = nil,
    )
    end
  end
end
