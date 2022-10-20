private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class KinesisDataStreamDestination
    include JSON::Serializable

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

    @[JSON::Field(key: "DestinationStatusDescription")]
    property destination_status_description : String | Nil

    def initialize(
      @stream_arn : String | Nil = nil,
      @destination_status : DestinationStatus | Nil = nil,
      @destination_status_description : String | Nil = nil
    )
    end
  end
end
