module Amazonite::CloudWatchLogsV1
  # Configuration for a lookup table destination. Use it to automatically refresh a lookup table
  # with query results on a schedule.
  class LookupTableConfiguration
    include JSON::Serializable

    # The name of the lookup table to create or update with query results. The name can contain only
    # alphanumeric characters and underscores.
    @[JSON::Field(key: "tableName")]
    property table_name : String

    # The ARN of the IAM role that grants permissions to create or update the lookup table with query
    # results.
    @[JSON::Field(key: "roleArn")]
    property role_arn : String

    # A description of the lookup table.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The ARN of the KMS key to use to encrypt the lookup table data. If you don't specify a key, the
    # data is encrypted with an Amazon Web Services-owned key.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # Key-value pairs to associate with the lookup table for resource management and cost allocation.
    # The service applies tags only during initial table creation.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @table_name : String,
      @role_arn : String,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @role_arn, @description, @kms_key_id, @tags)
  end
end
