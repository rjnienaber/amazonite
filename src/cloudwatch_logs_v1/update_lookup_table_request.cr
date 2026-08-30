private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class UpdateLookupTableRequest
    include JSON::Serializable

    # The ARN of the lookup table to update.
    @[JSON::Field(key: "lookupTableArn")]
    property lookup_table_arn : String

    # An updated description of the lookup table.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The new CSV content to replace the existing data. The first row must be a header row with column
    # names. The content must use UTF-8 encoding and not exceed 10 MB.
    #
    # You must specify either `tableBody` or `queryId`, but not both.
    @[JSON::Field(key: "tableBody")]
    property table_body : String | Nil

    # The ID of a completed or cancelled CloudWatch Logs query whose results replace the lookup table
    # content. A cancelled query replaces the content with the partial results that were available
    # when the query was stopped.
    #
    # You must specify either `tableBody` or `queryId`, but not both.
    @[JSON::Field(key: "queryId")]
    property query_id : String | Nil

    # The ARN of the KMS key to use to encrypt the lookup table data. You can use this parameter to
    # add, update, or remove the KMS key. To remove the KMS key and use an Amazon Web Services-owned
    # key instead, specify an empty string.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    def initialize(
      @lookup_table_arn : String,
      @description : String | Nil = nil,
      @table_body : String | Nil = nil,
      @query_id : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("description length must be <= 1024") if value.size > 1024
      end

      if value = @table_body
        raise Core::ValidationError.new("tableBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("tableBody length must be <= 10485760") if value.size > 10485760
      end

      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("kmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("kmsKeyId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@lookup_table_arn, @description, @table_body, @query_id, @kms_key_id)
  end
end
