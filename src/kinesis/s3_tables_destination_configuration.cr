private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The configuration for delivery to streaming tables on Apache Iceberg. Used in CreateChannel.
  class S3TablesDestinationConfiguration
    include JSON::Serializable

    # The maximum age, in seconds, of undelivered data. Valid range is 300 to 900 seconds (5 to 15
    # minutes). The default value is 300 seconds.
    @[JSON::Field(key: "DataFreshnessInSeconds")]
    property data_freshness_in_seconds : Int32 | Nil

    # The dead-letter queue configuration for records that cannot be delivered. Required for streaming
    # table destinations.
    @[JSON::Field(key: "DeadLetterQueueS3Configuration")]
    property dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration

    # The list of streaming table configurations. Currently, one table is supported per channel.
    @[JSON::Field(key: "S3TablesConfigurationList")]
    property s3_tables_configuration_list : Array(S3TablesConfiguration) = [] of S3TablesConfiguration

    def initialize(
      @dead_letter_queue_s3_configuration : DeadLetterQueueS3Configuration,
      @s3_tables_configuration_list : Array(S3TablesConfiguration),
      @data_freshness_in_seconds : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @dead_letter_queue_s3_configuration
        value.validate!
      end

      if value = @s3_tables_configuration_list
        raise Core::ValidationError.new("S3TablesConfigurationList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("S3TablesConfigurationList must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@data_freshness_in_seconds, @dead_letter_queue_s3_configuration, @s3_tables_configuration_list)
  end
end
