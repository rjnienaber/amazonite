private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Specifies one range of days or times to exclude from use for training an anomaly detection
  # model.
  class Range
    include JSON::Serializable

    # The start time of the range to exclude. The format is `yyyy-MM-dd'T'HH:mm:ss`. For example,
    # `2019-07-01T23:59:59`.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    # The end time of the range to exclude. The format is `yyyy-MM-dd'T'HH:mm:ss`. For example,
    # `2019-07-01T23:59:59`.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    def initialize(
      @start_time : Time,
      @end_time : Time,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@start_time, @end_time)
  end
end
