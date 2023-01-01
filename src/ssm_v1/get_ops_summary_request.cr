module Amazonite::SsmV1
  class GetOpsSummaryRequest
    include JSON::Serializable

    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(OpsResultAttribute) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil,
      @result_attributes : Array(OpsResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
