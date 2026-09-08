private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details about the Dedicated Host Reservation and associated Dedicated Hosts.
  class HostReservation
    # The number of Dedicated Hosts the reservation is associated with.
    property count : Int32 | Nil

    # The currency in which the `upfrontPrice` and `hourlyPrice` amounts are specified. At this time,
    # the only supported currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The length of the reservation's term, specified in seconds. Can be `31536000 (1 year)` |
    # `94608000 (3 years)`.
    property duration : Int32 | Nil

    # The date and time that the reservation ends.
    property end : Time | Nil

    # The IDs of the Dedicated Hosts associated with the reservation.
    property host_id_set : Array(String) | Nil

    # The ID of the reservation that specifies the associated Dedicated Hosts.
    property host_reservation_id : String | Nil

    # The hourly price of the reservation.
    property hourly_price : String | Nil

    # The instance family of the Dedicated Host Reservation. The instance family on the Dedicated Host
    # must be the same in order for it to benefit from the reservation.
    property instance_family : String | Nil

    # The ID of the reservation. This remains the same regardless of which Dedicated Hosts are
    # associated with it.
    property offering_id : String | Nil

    # The payment option selected for this reservation.
    property payment_option : PaymentOption | Nil

    # The date and time that the reservation started.
    property start : Time | Nil

    # The state of the reservation.
    property state : ReservationState | Nil

    # The upfront price of the reservation.
    property upfront_price : String | Nil

    # Any tags assigned to the Dedicated Host Reservation.
    property tags : Array(Tag) | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
      @duration : Int32 | Nil = nil,
      @end : Time | Nil = nil,
      @host_id_set : Array(String) | Nil = nil,
      @host_reservation_id : String | Nil = nil,
      @hourly_price : String | Nil = nil,
      @instance_family : String | Nil = nil,
      @offering_id : String | Nil = nil,
      @payment_option : PaymentOption | Nil = nil,
      @start : Time | Nil = nil,
      @state : ReservationState | Nil = nil,
      @upfront_price : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      if value = @duration
        params << {"#{prefix}Duration", value.to_s}
      end

      if value = @end
        params << {"#{prefix}End", Core::QueryValue.time(value)}
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

      if value = @offering_id
        params << {"#{prefix}OfferingId", value}
      end

      if value = @payment_option
        params << {"#{prefix}PaymentOption", value.to_json_object_key}
      end

      if value = @start
        params << {"#{prefix}Start", Core::QueryValue.time(value)}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @upfront_price
        params << {"#{prefix}UpfrontPrice", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='duration']")),
        end: Core::XMLValue.time(node.xpath_node("*[local-name()='end']")),
        host_id_set: node.xpath_nodes("*[local-name()='hostIdSet']/*[local-name()='item']").map { |n| n.content },
        host_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostReservationId']")),
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceFamily']")),
        offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='offeringId']")),
        payment_option: (n = node.xpath_node("*[local-name()='paymentOption']")) ? AEC::PaymentOption.from_json_object_key?(n.content) : nil,
        start: Core::XMLValue.time(node.xpath_node("*[local-name()='start']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ReservationState.from_json_object_key?(n.content) : nil,
        upfront_price: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontPrice']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@count, @currency_code, @duration, @end, @host_id_set, @host_reservation_id, @hourly_price, @instance_family, @offering_id, @payment_option, @start, @state, @upfront_price, @tags)
  end
end
