module Amazonite::CloudWatchV1
  class MetricDataQuery
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "MetricStat")]
    property metric_stat : MetricStat | Nil

    @[JSON::Field(key: "Expression")]
    property expression : String | Nil

    @[JSON::Field(key: "Label")]
    property label : String | Nil

    @[JSON::Field(key: "ReturnData")]
    property return_data : Bool | Nil

    @[JSON::Field(key: "Period")]
    property period : Int32 | Nil

    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    def initialize(
      @id : String,
      @metric_stat : MetricStat | Nil = nil,
      @expression : String | Nil = nil,
      @label : String | Nil = nil,
      @return_data : Bool | Nil = nil,
      @period : Int32 | Nil = nil,
      @account_id : String | Nil = nil,
    )
    end
  end
end
