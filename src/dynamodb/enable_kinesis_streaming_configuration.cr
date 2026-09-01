private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  # Enables setting the configuration for Kinesis Streaming.
  class EnableKinesisStreamingConfiguration
    include JSON::Serializable

    # Toggle for the precision of Kinesis data stream timestamp. The values are either `MILLISECOND`
    # or `MICROSECOND`.
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
