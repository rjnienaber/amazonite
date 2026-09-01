private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("tableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("tableName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("tableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_]+$"))
      end

      if value = @role_arn
        raise Core::ValidationError.new("roleArn length must be >= 1") if value.size < 1
      end

      if value = @description
        raise Core::ValidationError.new("description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("description length must be <= 1024") if value.size > 1024
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("kmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("kmsKeyId length must be <= 256") if value.size > 256
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@table_name, @role_arn, @description, @kms_key_id, @tags)
  end
end
