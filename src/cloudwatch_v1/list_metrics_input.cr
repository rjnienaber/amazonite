private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class ListMetricsInput
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(DimensionFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "RecentlyActive", converter: ACW::RecentlyActive)]
    property recently_active : RecentlyActive | Nil

    @[JSON::Field(key: "IncludeLinkedAccounts")]
    property include_linked_accounts : Bool | Nil

    @[JSON::Field(key: "OwningAccount")]
    property owning_account : String | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(DimensionFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @recently_active : RecentlyActive | Nil = nil,
      @include_linked_accounts : Bool | Nil = nil,
      @owning_account : String | Nil = nil,
    )
    end
  end
end
