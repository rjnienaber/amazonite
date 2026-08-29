private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class Range
    include JSON::Serializable

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    def initialize(
      @start_time : Time,
      @end_time : Time,
    )
    end
  end
end
