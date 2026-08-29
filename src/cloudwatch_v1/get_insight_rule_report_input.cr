private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetInsightRuleReportInput
    include JSON::Serializable

    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    @[JSON::Field(key: "Period")]
    property period : Int32

    @[JSON::Field(key: "MaxContributorCount")]
    property max_contributor_count : Int32 | Nil

    @[JSON::Field(key: "Metrics")]
    property metrics : Array(String) | Nil

    @[JSON::Field(key: "OrderBy")]
    property order_by : String | Nil

    def initialize(
      @rule_name : String,
      @start_time : Time,
      @end_time : Time,
      @period : Int32,
      @max_contributor_count : Int32 | Nil = nil,
      @metrics : Array(String) | Nil = nil,
      @order_by : String | Nil = nil,
    )
    end
  end
end
