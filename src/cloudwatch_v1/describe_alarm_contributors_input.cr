module Amazonite::CloudWatchV1
  class DescribeAlarmContributorsInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_name : String,
      @next_token : String | Nil = nil,
    )
    end
  end
end
