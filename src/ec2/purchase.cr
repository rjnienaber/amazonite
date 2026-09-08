private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the result of the purchase.
  class Purchase
    # The currency in which the `UpfrontPrice` and `HourlyPrice` amounts are specified. At this time,
    # the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The duration of the reservation's term in seconds.
    property duration : Int32 | Nil

    # The IDs of the Dedicated Hosts associated with the reservation.
    property host_id_set : Array(String) | Nil

    # The ID of the reservation.
    property host_reservation_id : String | Nil

    # The hourly price of the reservation per hour.
    property hourly_price : String | Nil

    # The instance family on the Dedicated Host that the reservation can be associated with.
    property instance_family : String | Nil

    # The payment option for the reservation.
    property payment_option : PaymentOption | Nil

    # The upfront price of the reservation.
    property upfront_price : String | Nil

    def initialize(
      @currency_code : CurrencyCodeValues | Nil = nil,
      @duration : Int32 | Nil = nil,
      @host_id_set : Array(String) | Nil = nil,
      @host_reservation_id : String | Nil = nil,
      @hourly_price : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @payment_option : PaymentOption | Nil = nil,
      @upfront_price : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      if value = @duration
        params << {"#{prefix}Duration", value.to_s}
      end

      (@host_id_set || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}HostIdSet.#{i}", item}
      end

      if value = @host_reservation_id
        params << {"#{prefix}HostReservationId", value}
      end

      if value = @hourly_price
        params << {"#{prefix}HourlyPrice", value}
      end

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      if value = @payment_option
        params << {"#{prefix}PaymentOption", value.to_json_object_key}
      end

      if value = @upfront_price
        params << {"#{prefix}UpfrontPrice", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='duration']")),
        host_id_set: node.xpath_nodes("*[local-name()='hostIdSet']/*[local-name()='item']").map { |n| n.content },
        host_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostReservationId']")),
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceFamily']")),
        payment_option: (n = node.xpath_node("*[local-name()='paymentOption']")) ? AEC::PaymentOption.from_json_object_key?(n.content) : nil,
        upfront_price: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontPrice']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@currency_code, @duration, @host_id_set, @host_reservation_id, @hourly_price, @instance_family, @payment_option, @upfront_price)
  end
end
