module Amazonite::CloudWatchLogsV1
  class DescribeSubscriptionFiltersResponse
    include JSON::Serializable

    # The subscription filters.
    @[JSON::Field(key: "subscriptionFilters")]
    property subscription_filters : Array(SubscriptionFilter) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @subscription_filters : Array(SubscriptionFilter) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
