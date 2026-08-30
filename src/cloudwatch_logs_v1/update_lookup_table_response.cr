private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class UpdateLookupTableResponse
    include JSON::Serializable

    # The ARN of the lookup table that was updated.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String | Nil

    # The time when the lookup table was last updated, expressed as the number of milliseconds after
    # `Jan 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @lookup_table_arn : String | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@lookup_table_arn, @last_updated_time)
  end
end
