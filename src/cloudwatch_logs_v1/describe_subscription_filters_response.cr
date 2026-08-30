private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @subscription_filters
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@subscription_filters, @next_token)
  end
end
