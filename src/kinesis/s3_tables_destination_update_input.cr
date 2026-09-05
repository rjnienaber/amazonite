module Amazonite::Kinesis
  # The updated configuration for a streaming table destination. Used in UpdateChannel. Only
  # `DataFreshnessInSeconds` can be updated.
  class S3TablesDestinationUpdateInput
    include JSON::Serializable

    # The maximum age, in seconds, of undelivered data. Valid range is 300 to 900 seconds (5 to 15
    # minutes).
    @[JSON::Field(key: "DataFreshnessInSeconds")]
    property data_freshness_in_seconds : Int32

    def initialize(
      @data_freshness_in_seconds : Int32,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@data_freshness_in_seconds)
  end
end
