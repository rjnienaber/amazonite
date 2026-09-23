private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the terms of a Capacity Reservation modification quote.
  class ModificationTerms
    # The changes that will be applied to the Capacity Reservation if you accept the modification
    # terms.
    property reservation_update : ModificationReservationUpdate | Nil

    def initialize(
      @reservation_update : ModificationReservationUpdate | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reservation_update
        params.concat(value.to_query_params("#{prefix}ReservationUpdate."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reservation_update: node.xpath_node("*[local-name()='reservationUpdate']").try { |n| ModificationReservationUpdate.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reservation_update
        value.validate!
      end
    end

    def_equals_and_hash(@reservation_update)
  end
end
