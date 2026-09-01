private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DeleteMetricFilterRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The name of the metric filter.
    @[JSON::Field(key: "filterName")]
    property filter_name : String

    def initialize(
      @log_group_name : String,
      @filter_name : String,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @filter_name
        raise Core::ValidationError.new("filterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("filterName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end
    end

    def_equals_and_hash(@log_group_name, @filter_name)
  end
end
