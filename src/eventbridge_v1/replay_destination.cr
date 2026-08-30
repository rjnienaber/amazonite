module Amazonite::EventBridgeV1
  # A `ReplayDestination` object that contains details about a replay.
  class ReplayDestination
    include JSON::Serializable

    # The ARN of the event bus to replay event to. You can replay events only to the event bus
    # specified to create the archive.
    @[JSON::Field(key: "Arn")]
    property arn : String

    # A list of ARNs for rules to replay events to.
    @[JSON::Field(key: "FilterArns")]
    property filter_arns : Array(String) | Nil

    def initialize(
      @arn : String,
      @filter_arns : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@arn, @filter_arns)
  end
end
