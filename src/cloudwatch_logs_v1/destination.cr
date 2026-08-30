module Amazonite::CloudWatchLogsV1
  # Represents a cross-account destination that receives subscription log events.
  class Destination
    include JSON::Serializable

    # The name of the destination.
    @[JSON::Field(key: "destinationName")]
    property destination_name : String | Nil

    # The Amazon Resource Name (ARN) of the physical target where the log events are delivered (for
    # example, a Kinesis stream).
    @[JSON::Field(key: "targetArn")]
    property target_arn : String | Nil

    # A role for impersonation, used when delivering log events to the target.
    @[JSON::Field(key: "roleArn")]
    property role_arn : String | Nil

    # An IAM policy document that governs which Amazon Web Services accounts can create subscription
    # filters against this destination.
    @[JSON::Field(key: "accessPolicy")]
    property access_policy : String | Nil

    # The ARN of this destination.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # The creation time of the destination, expressed as the number of milliseconds after Jan 1, 1970
    # 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    def initialize(
      @destination_name : String | Nil = nil,
      @target_arn : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @access_policy : String | Nil = nil,
      @arn : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
    )
    end
  end
end
