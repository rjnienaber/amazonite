private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class TagLogGroupRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The key-value pairs to use for the tags.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String)

    def initialize(
      @log_group_name : String,
      @tags : Hash(String, String),
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@log_group_name, @tags)
  end
end
