private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

      if value = @access_policy
        raise Core::ValidationError.new("accessPolicy length must be >= 1") if value.size < 1
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@destination_name, @target_arn, @role_arn, @access_policy, @arn, @creation_time)
  end
end
