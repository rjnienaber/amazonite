private alias Core = Amazonite::Core

module Amazonite::EC2
  # The result of the exchange and whether it was `successful`.
  class AcceptReservedInstancesExchangeQuoteResult
    # The ID of the successful exchange.
    property exchange_id : String | Nil

    def initialize(
      @exchange_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @exchange_id
        params << {"#{prefix}ExchangeId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exchange_id: Core::XMLValue.string(node.xpath_node("*[local-name()='exchangeId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@exchange_id)
  end
end
