module Amazonite::CloudWatchV1
  class DescribeAlarmContributorsInput
    include JSON::Serializable

    # The name of the alarm for which to retrieve contributor information.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    # The token returned by a previous call to indicate that there is more data available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_name : String,
      @next_token : String | Nil = nil,
    )
    end
  end
end
