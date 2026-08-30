private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Describes a Kinesis data stream destination.
  class KinesisDataStreamDestination
    include JSON::Serializable

    # The ARN for a specific Kinesis data stream.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    # The current status of replication.
    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

    # The human-readable string that corresponds to the replica status.
    @[JSON::Field(key: "DestinationStatusDescription")]
    property destination_status_description : String | Nil

    # The precision of the Kinesis data stream timestamp. The values are either `MILLISECOND` or
    # `MICROSECOND`.
    @[JSON::Field(key: "ApproximateCreationDateTimePrecision", converter: ADDB::ApproximateCreationDateTimePrecision)]
    property approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil

    def initialize(
      @stream_arn : String | Nil = nil,
      @destination_status : DestinationStatus | Nil = nil,
      @destination_status_description : String | Nil = nil,
      @approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("StreamArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stream_arn, @destination_status, @destination_status_description, @approximate_creation_date_time_precision)
  end
end
