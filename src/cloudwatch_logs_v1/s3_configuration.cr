module Amazonite::CloudWatchLogsV1
  # Configuration for Amazon S3 destination where scheduled query results are delivered.
  class S3Configuration
    include JSON::Serializable

    # The Amazon S3 URI where query results are delivered. Must be a valid S3 URI format.
    @[JSON::Field(key: "destinationIdentifier")]
    property destination_identifier : String

    # The ARN of the IAM role that grants permissions to write query results to the specified Amazon
    # S3 destination.
    @[JSON::Field(key: "roleArn")]
    property role_arn : String

    # The Amazon Web Services accountId for the bucket owning account.
    @[JSON::Field(key: "ownerAccountId")]
    property owner_account_id : String | Nil

    # The Amazon Resource Name (ARN) of the KMS encryption key. Must belong to the same Amazon Web
    # Services Region as the destination Amazon S3 bucket.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    def initialize(
      @destination_identifier : String,
      @role_arn : String,
      @owner_account_id : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end
  end
end
