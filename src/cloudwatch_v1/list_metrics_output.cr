module Amazonite::CloudWatchV1
  class ListMetricsOutput
    include JSON::Serializable

    @[JSON::Field(key: "Metrics")]
    property metrics : Array(Metric) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "OwningAccounts")]
    property owning_accounts : Array(String) | Nil

    def initialize(
      @metrics : Array(Metric) | Nil = nil,
      @next_token : String | Nil = nil,
      @owning_accounts : Array(String) | Nil = nil,
    )
    end
  end
end
