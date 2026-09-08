private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetHostReservationPurchasePreviewResult
    # The currency in which the `totalUpfrontPrice` and `totalHourlyPrice` amounts are specified. At
    # this time, the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The purchase information of the Dedicated Host reservation and the Dedicated Hosts associated
    # with it.
    property purchase : Array(Purchase) | Nil

    # The potential total hourly price of the reservation per hour.
    property total_hourly_price : String | Nil

    # The potential total upfront price. This is billed immediately.
    property total_upfront_price : String | Nil

    def initialize(
      @currency_code : CurrencyCodeValues | Nil = nil,
      @purchase : Array(Purchase) | Nil = nil,
      @total_hourly_price : String | Nil = nil,
      @total_upfront_price : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      (@purchase || [] of Purchase).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Purchase.#{i}."))
      end

      if value = @total_hourly_price
        params << {"#{prefix}TotalHourlyPrice", value}
      end

      if value = @total_upfront_price
        params << {"#{prefix}TotalUpfrontPrice", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        purchase: node.xpath_nodes("*[local-name()='purchase']/*[local-name()='item']").map { |n| Purchase.from_xml(n) },
        total_hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='totalHourlyPrice']")),
        total_upfront_price: Core::XMLValue.string(node.xpath_node("*[local-name()='totalUpfrontPrice']")),
      )
    end

    def validate! : Nil
      if value = @purchase
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@currency_code, @purchase, @total_hourly_price, @total_upfront_price)
  end
end
