private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @lookup_table_name
        raise Core::ValidationError.new("lookupTableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("lookupTableName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("lookupTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("description length must be <= 1024") if value.size > 1024
      end

      if value = @records_count
        raise Core::ValidationError.new("recordsCount value must be >= 0") if value < 0
      end

      if value = @size_bytes
        raise Core::ValidationError.new("sizeBytes value must be >= 0") if value < 0
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("kmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("kmsKeyId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@lookup_table_arn, @lookup_table_name, @description, @table_fields, @records_count, @size_bytes, @last_updated_time, @kms_key_id)
  end
end
