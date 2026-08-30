module Amazonite::CloudWatchLogsV1
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

    def_equals_and_hash(@log_group_name, @filter_name)
  end
end
