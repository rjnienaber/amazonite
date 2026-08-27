private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class EnableKinesisStreamingConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "ApproximateCreationDateTimePrecision", converter: ADDB::ApproximateCreationDateTimePrecision)]
    property approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil

    def initialize(
      @approximate_creation_date_time_precision : ApproximateCreationDateTimePrecision | Nil = nil,
    )
    end
  end
end
