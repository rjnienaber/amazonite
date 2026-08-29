private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class MetricStat
    include JSON::Serializable

    @[JSON::Field(key: "Metric")]
    property metric : Metric

    @[JSON::Field(key: "Period")]
    property period : Int32

    @[JSON::Field(key: "Stat")]
    property stat : String

    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @metric : Metric,
      @period : Int32,
      @stat : String,
      @unit : StandardUnit | Nil = nil,
    )
    end
  end
end
