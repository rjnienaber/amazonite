private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  # Enables updating the configuration for Kinesis Streaming.
  class UpdateKinesisStreamingConfiguration
    include JSON::Serializable

    # Enables updating the precision of Kinesis data stream timestamp.
    @[JSON::Field(key: "ApproximateCreationDateTimePrecision", converter: ADDB::ApproximateCreationDateTimePrecision)]
    property approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil

    def initialize(
      @approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@approximate_creation_date_time_precision)
  end
end
