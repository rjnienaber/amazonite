module Amazonite::CloudWatchLogsV1
  class CreateLookupTableResponse
    include JSON::Serializable

    # The ARN of the lookup table that was created.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String | Nil

    # The time when the lookup table was created, expressed as the number of milliseconds after `Jan
    # 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "createdAt")]
    property created_at : Int64 | Nil

    def initialize(
      @lookup_table_arn : String | Nil = nil,
      @created_at : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@lookup_table_arn, @created_at)
  end
end
