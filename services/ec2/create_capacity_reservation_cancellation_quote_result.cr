private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationCancellationQuoteResult
    # Information about the Capacity Reservation cancellation quote.
    property capacity_reservation_cancellation_quote : CapacityReservationCancellationQuote | Nil

    def initialize(
      @capacity_reservation_cancellation_quote : CapacityReservationCancellationQuote | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_cancellation_quote
        params.concat(value.to_query_params("#{prefix}CapacityReservationCancellationQuote."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_cancellation_quote: node.xpath_node("*[local-name()='capacityReservationCancellationQuote']").try { |n| CapacityReservationCancellationQuote.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_cancellation_quote
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_cancellation_quote)
  end
end
