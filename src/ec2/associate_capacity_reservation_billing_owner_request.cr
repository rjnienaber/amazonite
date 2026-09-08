private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateCapacityReservationBillingOwnerRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String

    # The ID of the consumer account to which to assign billing.
    property unused_reservation_billing_owner_id : String

    def initialize(
      @capacity_reservation_id : String,
      @unused_reservation_billing_owner_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      params << {"#{prefix}UnusedReservationBillingOwnerId", @unused_reservation_billing_owner_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        unused_reservation_billing_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UnusedReservationBillingOwnerId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @unused_reservation_billing_owner_id
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end
    end

    def_equals_and_hash(@dry_run, @capacity_reservation_id, @unused_reservation_billing_owner_id)
  end
end
