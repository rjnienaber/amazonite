private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration that a Capacity Reservation has at the time a modification quote is
  # generated.
  class ModificationQuoteCurrentConfiguration
    # The number of instances in the Capacity Reservation.
    property instance_count : Int32 | Nil

    # The current state of the Capacity Reservation.
    property reservation_state : String | Nil

    # The start date that the Capacity Reservation has before the quoted modification is applied.
    property start_date : Time | Nil

    # The start date that the Capacity Reservation was originally requested with. This value does not
    # change when you push out the start date.
    property original_start_date : Time | Nil

    def initialize(
      @instance_count : Int32 | Nil = nil,
      @reservation_state : String | Nil = nil,
      @start_date : Time | Nil = nil,
      @original_start_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @reservation_state
        params << {"#{prefix}ReservationState", value}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @original_start_date
        params << {"#{prefix}OriginalStartDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        reservation_state: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationState']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        original_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='originalStartDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @reservation_state, @start_date, @original_start_date)
  end
end
