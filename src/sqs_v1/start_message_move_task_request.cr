module Amazonite::SqsV1
  class StartMessageMoveTaskRequest
    include JSON::Serializable

    @[JSON::Field(key: "SourceArn")]
    property source_arn : String

    @[JSON::Field(key: "DestinationArn")]
    property destination_arn : String | Nil

    @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
    property max_number_of_messages_per_second : Int32 | Nil

    def initialize(
      @source_arn : String,
      @destination_arn : String | Nil = nil,
      @max_number_of_messages_per_second : Int32 | Nil = nil,
    )
    end
  end
end
