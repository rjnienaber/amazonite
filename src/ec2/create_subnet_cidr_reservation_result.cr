private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSubnetCidrReservationResult
    # Information about the created subnet CIDR reservation.
    property subnet_cidr_reservation : SubnetCidrReservation | Nil

    def initialize(
      @subnet_cidr_reservation : SubnetCidrReservation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_cidr_reservation
        params.concat(value.to_query_params("#{prefix}SubnetCidrReservation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_cidr_reservation: node.xpath_node("*[local-name()='subnetCidrReservation']").try { |n| SubnetCidrReservation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @subnet_cidr_reservation
        value.validate!
      end
    end

    def_equals_and_hash(@subnet_cidr_reservation)
  end
end
