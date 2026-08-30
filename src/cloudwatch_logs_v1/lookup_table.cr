module Amazonite::CloudWatchLogsV1
  # Contains metadata about a lookup table returned by `DescribeLookupTables`.
  class LookupTable
    include JSON::Serializable

    # The ARN of the lookup table.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String | Nil

    # The name of the lookup table.
    @[JSON::Field(key: "lookupTableName")]
    property lookup_table_name : String | Nil

    # The description of the lookup table.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The column headers from the first row of the CSV file.
    @[JSON::Field(key: "tableFields")]
    property table_fields : Array(String) | Nil

    # The number of data rows in the lookup table, excluding the header row.
    @[JSON::Field(key: "recordsCount")]
    property records_count : Int64 | Nil

    # The size of the lookup table in bytes.
    @[JSON::Field(key: "sizeBytes")]
    property size_bytes : Int64 | Nil

    # The time when the lookup table was last updated, expressed as the number of milliseconds after
    # `Jan 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    # The ARN of the KMS key used to encrypt the lookup table data, if applicable.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    def initialize(
      @lookup_table_arn : String | Nil = nil,
      @lookup_table_name : String | Nil = nil,
      @description : String | Nil = nil,
      @table_fields : Array(String) | Nil = nil,
      @records_count : Int64 | Nil = nil,
      @size_bytes : Int64 | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@lookup_table_arn, @lookup_table_name, @description, @table_fields, @records_count, @size_bytes, @last_updated_time, @kms_key_id)
  end
end
