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

    def_equals_and_hash(@lookup_table_arn, @description, @table_body, @query_id, @kms_key_id)
  end
end
