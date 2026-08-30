module Amazonite::CloudWatchLogsV1
  class GetLookupTableRequest
    include JSON::Serializable

    # The ARN of the lookup table to retrieve.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String

    def initialize(
      @lookup_table_arn : String,
    )
    end
  end
end
