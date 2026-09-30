private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseHostReservationResult
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The currency in which the `totalUpfrontPrice` and `totalHourlyPrice` amounts are specified. At
    # this time, the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # Describes the details of the purchase.
    property purchase : Array(Purchase) | Nil

    # The total hourly price of the reservation calculated per hour.
    property total_hourly_price : String | Nil

    # The total amount charged to your account when you purchase the reservation.
    property total_upfront_price : String | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
      @purchase : Array(Purchase) | Nil = nil,
      @total_hourly_price : String | Nil = nil,
      @total_upfront_price : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

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
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
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

    def_equals_and_hash(@client_token, @currency_code, @purchase, @total_hourly_price, @total_upfront_price)
  end
end
