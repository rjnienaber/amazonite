private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The configuration for delivery to a general purpose Amazon S3 bucket. Used in CreateChannel.
  class S3DestinationConfiguration
    include JSON::Serializable

    # The maximum age, in seconds, of undelivered data. Valid range is 300 to 900 seconds (5 to 15
    # minutes). The default value is 300 seconds.
    @[JSON::Field(key: "DataFreshnessInSeconds")]
    property data_freshness_in_seconds : Int32 | Nil

    # The dead-letter queue configuration for records that cannot be delivered. Optional for general
    # purpose Amazon S3 destinations. If not specified, it defaults to the destination bucket with an
    # error prefix.
    @[JSON::Field(key: "DeadLetterQueueS3Configuration")]
    property dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration | Nil

    # The Amazon S3 storage configuration for the channel.
    @[JSON::Field(key: "StorageConfiguration")]
    property storage_configuration : S3StorageConfiguration

    def initialize(
      @storage_configuration : S3StorageConfiguration,
      @data_freshness_in_seconds : Int32 | Nil = nil,
      @dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration | Nil = nil,
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
