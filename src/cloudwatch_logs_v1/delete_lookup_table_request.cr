module Amazonite::CloudWatchLogsV1
  class DeleteLookupTableRequest
    include JSON::Serializable

    # The ARN of the lookup table to delete.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String

    def initialize(
      @lookup_table_arn : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@lookup_table_arn)
  end
end
