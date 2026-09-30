private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class DescribeAlarmContributorsOutput
    include JSON::Serializable

    # A list of alarm contributors that provide details about the individual time series contributing
    # to the alarm's state.
    @[JSON::Field(key: "AlarmContributors")]
    property alarm_contributors : Array(AlarmContributor) = [] of AlarmContributor

    # The token that marks the start of the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_contributors : Array(AlarmContributor),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_contributors
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@alarm_contributors, @next_token)
  end
end
