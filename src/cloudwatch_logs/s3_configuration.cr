private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @destination_identifier
        raise Core::ValidationError.new("destinationIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("destinationIdentifier length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("destinationIdentifier does not match the required pattern") unless value.matches?(Regex.new("^s3://[a-z0-9][\\.\\-a-z0-9]{1,61}[a-z0-9](/.*)?$"))
      end

      if value = @role_arn
        raise Core::ValidationError.new("roleArn length must be >= 1") if value.size < 1
      end

      if value = @owner_account_id
        raise Core::ValidationError.new("ownerAccountId length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("ownerAccountId length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("ownerAccountId does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("kmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("kmsKeyId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@destination_identifier, @role_arn, @owner_account_id, @kms_key_id)
  end
end
