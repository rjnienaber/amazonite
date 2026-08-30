private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class PutDestinationRequest
    include JSON::Serializable

    # A name for the destination.
    @[JSON::Field(key: "destinationName")]
    property destination_name : String

    # The ARN of an Amazon Kinesis stream to which to deliver matching log events.
    @[JSON::Field(key: "targetArn")]
    property target_arn : String

    # The ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis
    # `PutRecord` operation on the destination stream.
    @[JSON::Field(key: "roleArn")]
    property role_arn : String

    # An optional list of key-value pairs to associate with the resource.
    #
    # For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @destination_name : String,
      @target_arn : String,
      @role_arn : String,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @destination_name
        raise Core::ValidationError.new("destinationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destinationName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("destinationName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @target_arn
        raise Core::ValidationError.new("targetArn length must be >= 1") if value.size < 1
      end

      if value = @role_arn
        raise Core::ValidationError.new("roleArn length must be >= 1") if value.size < 1
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@destination_name, @target_arn, @role_arn, @tags)
  end
end
