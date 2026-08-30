module Amazonite::CloudWatchLogsV1
  class CreateLookupTableRequest
    include JSON::Serializable

    # The name of the lookup table. The name must be unique within your account and Region. The name
    # can contain only alphanumeric characters and underscores, and can be up to 256 characters long.
    @[JSON::Field(key: "lookupTableName")]
    property lookup_table_name : String

    # A description of the lookup table. The description can be up to 1024 characters long.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The CSV content of the lookup table. The first row must be a header row with column names. The
    # content must use UTF-8 encoding and not exceed 10 MB.
    #
    # You must specify either `tableBody` or `queryId`, but not both.
    @[JSON::Field(key: "tableBody")]
    property table_body : String | Nil

    # The ID of a completed or cancelled CloudWatch Logs query whose results populate the lookup
    # table. A cancelled query populates the table with the partial results that were available when
    # the query was stopped.
    #
    # You must specify either `tableBody` or `queryId`, but not both.
    @[JSON::Field(key: "queryId")]
    property query_id : String | Nil

    # The ARN of the KMS key to use to encrypt the lookup table data. If you don't specify a key, the
    # data is encrypted with an Amazon Web Services-owned key.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # A list of key-value pairs to associate with the lookup table. You can associate as many as 50
    # tags with a lookup table. Tags can help you organize and categorize your resources.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @lookup_table_name : String,
      @description : String | Nil = nil,
      @table_body : String | Nil = nil,
      @query_id : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@lookup_table_name, @description, @table_body, @query_id, @kms_key_id, @tags)
  end
end
