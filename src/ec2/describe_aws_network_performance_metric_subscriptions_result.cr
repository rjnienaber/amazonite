private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAwsNetworkPerformanceMetricSubscriptionsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Describes the current Infrastructure Performance subscriptions.
    property subscriptions : Array(Subscription) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @subscriptions : Array(Subscription) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@subscriptions || [] of Subscription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubscriptionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        subscriptions: node.xpath_nodes("*[local-name()='subscriptionSet']/*[local-name()='item']").map { |n| Subscription.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @subscriptions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @subscriptions)
  end
end
