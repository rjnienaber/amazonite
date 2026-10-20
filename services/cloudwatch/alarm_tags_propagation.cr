private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Includes the alarm's tags in the notifications that the alarm sends to Amazon SNS topics and
  # Lambda functions. The tags are also included in the alarm's state-change events in Amazon
  # EventBridge. Other types of alarm actions don't receive the tags.
  #
  # By default, the alarm's tags aren't included.
  #
  # Use this to route or filter notifications and events by tag, such as by team or environment. You
  # can also use it to read the alarm's tags without looking them up separately.
  #
  # To limit which tags are included, specify either `IncludedTagKeys` or `ExcludedTagKeys`. You
  # can't specify both. If you specify neither, all of the alarm's tags are included. This includes
  # tags that you add to the alarm later.
  class AlarmTagsPropagation
    include JSON::Serializable

    # Set to `true` to include the alarm's tags. Set to `false` to stop including them.
    #
    # When this is `true`, you must have the `cloudwatch:ListTagsForResource` permission on the alarm
    # to create or update it.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool

    # The tag keys to include. Only the alarm's tags with these keys are included.
    #
    # You can specify 1 to 50 tag keys. Each tag key must be 1 to 128 characters long.
    #
    # You can't specify both `IncludedTagKeys` and `ExcludedTagKeys`.
    @[JSON::Field(key: "IncludedTagKeys")]
    property included_tag_keys : Array(String) | Nil

    # The tag keys to exclude. All of the alarm's tags except those with these keys are included.
    #
    # You can specify 1 to 50 tag keys. Each tag key must be 1 to 128 characters long.
    #
    # You can't specify both `IncludedTagKeys` and `ExcludedTagKeys`.
    @[JSON::Field(key: "ExcludedTagKeys")]
    property excluded_tag_keys : Array(String) | Nil

    def initialize(
      @enabled : Bool,
      @included_tag_keys : Array(String) | Nil = nil,
      @excluded_tag_keys : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @included_tag_keys
        raise Core::ValidationError.new("IncludedTagKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("IncludedTagKeys must have at most 50 item(s)") if value.size > 50
      end

      if value = @excluded_tag_keys
        raise Core::ValidationError.new("ExcludedTagKeys must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ExcludedTagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@enabled, @included_tag_keys, @excluded_tag_keys)
  end
end
