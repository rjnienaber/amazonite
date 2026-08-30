module Amazonite::CloudWatchLogsV1
  # Configuration for where to deliver scheduled query results. Specifies the destination type and
  # associated settings for result delivery.
  class DestinationConfiguration
    include JSON::Serializable

    # Configuration for delivering query results to Amazon S3.
    @[JSON::Field(key: "s3Configuration")]
    property s3_configuration : S3Configuration | Nil

    # Configuration for delivering query results to a lookup table. The query results automatically
    # populate or refresh the specified lookup table on each scheduled execution.
    @[JSON::Field(key: "lookupTableConfiguration")]
    property lookup_table_configuration : LookupTableConfiguration | Nil

    def initialize(
      @s3_configuration : S3Configuration | Nil = nil,
      @lookup_table_configuration : LookupTableConfiguration | Nil = nil,
    )
    end
  end
end
