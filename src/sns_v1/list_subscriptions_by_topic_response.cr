private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response for ListSubscriptionsByTopic action.
  class ListSubscriptionsByTopicResponse
    # A list of subscriptions.
    property subscriptions : Array(Subscription) | Nil

    # Token to pass along to the next `ListSubscriptionsByTopic` request. This element is returned if
    # there are more subscriptions to retrieve.
    property next_token : String | Nil

    def initialize(
      @subscriptions : Array(Subscription) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@subscriptions || [] of Subscription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Subscriptions.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subscriptions: node.xpath_nodes("*[local-name()='Subscriptions']/*[local-name()='member']").map { |n| Subscription.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
