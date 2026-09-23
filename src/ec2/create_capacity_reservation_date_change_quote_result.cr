private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationDateChangeQuoteResult
    # Information about the Capacity Reservation date change quote.
    property capacity_reservation_modification_quote : CapacityReservationModificationQuote | Nil

    def initialize(
      @capacity_reservation_modification_quote : CapacityReservationModificationQuote | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_modification_quote
        params.concat(value.to_query_params("#{prefix}CapacityReservationModificationQuote."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_modification_quote: node.xpath_node("*[local-name()='capacityReservationModificationQuote']").try { |n| CapacityReservationModificationQuote.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_modification_quote
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_modification_quote)
  end
end
