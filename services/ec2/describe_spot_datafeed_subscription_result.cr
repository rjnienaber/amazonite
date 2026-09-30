private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeSpotDatafeedSubscription.
  class DescribeSpotDatafeedSubscriptionResult
    # The Spot Instance data feed subscription.
    property spot_datafeed_subscription : SpotDatafeedSubscription | Nil

    def initialize(
      @spot_datafeed_subscription : SpotDatafeedSubscription | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @spot_datafeed_subscription
        params.concat(value.to_query_params("#{prefix}SpotDatafeedSubscription."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        spot_datafeed_subscription: node.xpath_node("*[local-name()='spotDatafeedSubscription']").try { |n| SpotDatafeedSubscription.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_datafeed_subscription
        value.validate!
      end
    end

    def_equals_and_hash(@spot_datafeed_subscription)
  end
end
