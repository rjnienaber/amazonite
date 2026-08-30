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
  end
end
