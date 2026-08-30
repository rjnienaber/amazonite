private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed
  # node-level logs to.
  #
  # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
  # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
  # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
  # Manager handles these options for the supported maintenance window task types, see
  # MaintenanceWindowTaskInvocationParameters.
  class LoggingInfo
    include JSON::Serializable

    # The name of an S3 bucket where execution logs are stored.
    @[JSON::Field(key: "S3BucketName")]
    property s3_bucket_name : String

    # (Optional) The S3 bucket subfolder.
    @[JSON::Field(key: "S3KeyPrefix")]
    property s3_key_prefix : String | Nil

    # The Amazon Web Services Region where the S3 bucket is located.
    @[JSON::Field(key: "S3Region")]
    property s3_region : String

    def initialize(
      @s3_bucket_name : String,
      @s3_region : String,
      @s3_key_prefix : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @s3_bucket_name
        raise Core::ValidationError.new("S3BucketName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("S3BucketName length must be <= 63") if value.size > 63
      end

      if value = @s3_key_prefix
        raise Core::ValidationError.new("S3KeyPrefix length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("S3KeyPrefix length must be <= 500") if value.size > 500
      end

      if value = @s3_region
        raise Core::ValidationError.new("S3Region length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("S3Region length must be <= 20") if value.size > 20
      end
    end

    def_equals_and_hash(@s3_bucket_name, @s3_key_prefix, @s3_region)
  end
end
