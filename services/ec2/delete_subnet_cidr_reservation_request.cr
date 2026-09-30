private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSubnetCidrReservationRequest
    # The ID of the subnet CIDR reservation.
    property subnet_cidr_reservation_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @subnet_cidr_reservation_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SubnetCidrReservationId", @subnet_cidr_reservation_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_cidr_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetCidrReservationId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subnet_cidr_reservation_id, @dry_run)
  end
end
