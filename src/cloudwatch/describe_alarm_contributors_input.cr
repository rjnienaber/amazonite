private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@alarm_name, @next_token)
  end
end
