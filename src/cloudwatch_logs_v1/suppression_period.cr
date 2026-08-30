private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # If you are suppressing an anomaly temporariliy, this structure defines how long the suppression
  # period is to be.
  class SuppressionPeriod
    include JSON::Serializable

    # Specifies the number of seconds, minutes or hours to suppress this anomaly. There is no maximum.
    @[JSON::Field(key: "value")]
    property value : Int32 | Nil

    # Specifies whether the value of `value` is in seconds, minutes, or hours.
    @[JSON::Field(key: "suppressionUnit", converter: ACWL::SuppressionUnit)]
    property suppression_unit : SuppressionUnit | Nil

    def initialize(
      @value : Int32 | Nil = nil,
      @suppression_unit : SuppressionUnit | Nil = nil,
    )
    end
  end
end
