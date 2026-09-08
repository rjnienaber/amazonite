private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details about the Dedicated Host Reservation offering.
  class HostOffering
    # The currency of the offering.
    property currency_code : CurrencyCodeValues | Nil

    # The duration of the offering (in seconds).
    property duration : Int32 | Nil

    # The hourly price of the offering.
    property hourly_price : String | Nil

    # The instance family of the offering.
    property instance_family : String | Nil

    # The ID of the offering.
    property offering_id : String | Nil

    # The available payment option.
    property payment_option : PaymentOption | Nil

    # The upfront price of the offering. Does not apply to No Upfront offerings.
    property upfront_price : String | Nil

    def initialize(
      @currency_code : CurrencyCodeValues | Nil = nil,
      @duration : Int32 | Nil = nil,
      @hourly_price : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @offering_id : String | Nil = nil,
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

      if value = @hourly_price
        params << {"#{prefix}HourlyPrice", value}
      end

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      if value = @offering_id
        params << {"#{prefix}OfferingId", value}
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
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceFamily']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='offeringId']")),
        payment_option: (n = node.xpath_node("*[local-name()='paymentOption']")) ? AEC::PaymentOption.from_json_object_key?(n.content) : nil,
        upfront_price: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontPrice']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@currency_code, @duration, @hourly_price, @instance_family, @offering_id, @payment_option, @upfront_price)
  end
end
