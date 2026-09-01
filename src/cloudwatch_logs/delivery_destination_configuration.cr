module Amazonite::CloudWatchLogs
  # A structure that contains information about one logs delivery destination.
  class DeliveryDestinationConfiguration
    include JSON::Serializable

    # The ARN of the Amazon Web Services destination that this delivery destination represents. That
    # Amazon Web Services destination can be a log group in CloudWatch Logs, an Amazon S3 bucket, or a
    # delivery stream in Firehose.
    @[JSON::Field(key: "destinationResourceArn")]
    property destination_resource_arn : String

    def initialize(
      @destination_resource_arn : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_resource_arn)
  end
end
