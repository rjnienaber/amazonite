private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about the target S3 bucket for the resource data sync.
  class ResourceDataSyncS3Destination
    include JSON::Serializable

    # The name of the S3 bucket where the aggregated data is stored.
    @[JSON::Field(key: "BucketName")]
    property bucket_name : String

    # An Amazon S3 prefix for the bucket.
    @[JSON::Field(key: "Prefix")]
    property prefix : String | Nil

    # A supported sync format. The following format is currently supported: JsonSerDe
    @[JSON::Field(key: "SyncFormat", converter: AS::ResourceDataSyncS3Format)]
    property sync_format : ResourceDataSyncS3Format

    # The Amazon Web Services Region with the S3 bucket targeted by the resource data sync.
    @[JSON::Field(key: "Region")]
    property region : String

    # The ARN of an encryption key for a destination in Amazon S3. Must belong to the same Region as
    # the destination S3 bucket.
    @[JSON::Field(key: "AWSKMSKeyARN")]
    property awskms_key_arn : String | Nil

    # Enables destination data sharing. By default, this field is `null`.
    @[JSON::Field(key: "DestinationDataSharing")]
    property destination_data_sharing : ResourceDataSyncDestinationDataSharing | Nil

    def initialize(
      @bucket_name : String,
      @sync_format : ResourceDataSyncS3Format,
      @region : String,
      @prefix : String | Nil = nil,
      @awskms_key_arn : String | Nil = nil,
      @destination_data_sharing : ResourceDataSyncDestinationDataSharing | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bucket_name
        raise Core::ValidationError.new("BucketName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BucketName length must be <= 2048") if value.size > 2048
      end

      if value = @prefix
        raise Core::ValidationError.new("Prefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Prefix length must be <= 256") if value.size > 256
      end

      if value = @region
        raise Core::ValidationError.new("Region length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Region length must be <= 64") if value.size > 64
      end

      if value = @awskms_key_arn
        raise Core::ValidationError.new("AWSKMSKeyARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AWSKMSKeyARN length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("AWSKMSKeyARN does not match the required pattern") unless value.matches?(Regex.new("^arn:"))
      end

      if value = @destination_data_sharing
        value.validate!
      end
    end

    def_equals_and_hash(@bucket_name, @prefix, @sync_format, @region, @awskms_key_arn, @destination_data_sharing)
  end
end
