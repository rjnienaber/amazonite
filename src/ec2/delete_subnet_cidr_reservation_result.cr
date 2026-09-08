private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSubnetCidrReservationResult
    # Information about the deleted subnet CIDR reservation.
    property deleted_subnet_cidr_reservation : SubnetCidrReservation | Nil

    def initialize(
      @deleted_subnet_cidr_reservation : SubnetCidrReservation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @deleted_subnet_cidr_reservation
        params.concat(value.to_query_params("#{prefix}DeletedSubnetCidrReservation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deleted_subnet_cidr_reservation: node.xpath_node("*[local-name()='deletedSubnetCidrReservation']").try { |n| SubnetCidrReservation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @deleted_subnet_cidr_reservation
        value.validate!
      end
    end

    def_equals_and_hash(@deleted_subnet_cidr_reservation)
  end
end
