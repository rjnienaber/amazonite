private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class KinesisDataStreamDestination
    include JSON::Serializable

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

    @[JSON::Field(key: "DestinationStatusDescription")]
    property destination_status_description : String | Nil

    @[JSON::Field(key: "ApproximateCreationDateTimePrecision", converter: ADDB::ApproximateCreationDateTimePrecision)]
    property approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil

    def initialize(
      @stream_arn : String | Nil = nil,
      @destination_status : DestinationStatus | Nil = nil,
      @destination_status_description : String | Nil = nil,
      @approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil = nil,
    )
    end
  end
end
