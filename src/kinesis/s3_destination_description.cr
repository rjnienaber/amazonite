private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The configuration for delivery to a general purpose Amazon S3 bucket. Returned in
  # ChannelDescription.
  class S3DestinationDescription
    include JSON::Serializable

    # The maximum age, in seconds, of undelivered data.
    @[JSON::Field(key: "DataFreshnessInSeconds")]
    property data_freshness_in_seconds : Int32

    # The dead-letter queue configuration for records that cannot be delivered.
    @[JSON::Field(key: "DeadLetterQueueS3Configuration")]
    property dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration

    # The Amazon S3 storage configuration for the channel.
    @[JSON::Field(key: "StorageConfiguration")]
    property storage_configuration : S3StorageConfiguration

    def initialize(
      @data_freshness_in_seconds : Int32,
      @dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration,
      @storage_configuration : S3StorageConfiguration,
    )
    end

    def validate! : Nil
      if value = @dead_letter_queue_s3_configuration
        value.validate!
      end

      if value = @storage_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@data_freshness_in_seconds, @dead_letter_queue_s3_configuration, @storage_configuration)
  end
end
