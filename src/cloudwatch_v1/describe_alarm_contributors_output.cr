module Amazonite::CloudWatchV1
  class DescribeAlarmContributorsOutput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmContributors")]
    property alarm_contributors : Array(AlarmContributor) = [] of AlarmContributor

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_contributors : Array(AlarmContributor),
      @next_token : String | Nil = nil,
    )
    end
  end
end
