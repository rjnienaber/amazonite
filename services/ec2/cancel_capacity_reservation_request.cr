private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelCapacityReservationRequest
    # The ID of the Capacity Reservation to be cancelled.
    property capacity_reservation_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specifies the cancellation charge type to apply when cancelling a future-dated Capacity
    # Reservation during its commitment duration. Possible values include `commitment-wind-down`,
    # which continues billing for the remaining commitment duration without delivering capacity.
    property apply_cancellation_charges : ApplyCancellationCharges | Nil

    # The ID of the cancellation quote to use for the cancellation. You can generate a cancellation
    # quote by using the `CreateCapacityReservationCancellationQuote` action. The cancellation quote
    # must be in an `active` state.
    property quote_id : String | Nil

    def initialize(
      @capacity_reservation_id : String,
      @dry_run : Bool | Nil = nil,
      @apply_cancellation_charges : ApplyCancellationCharges | Nil = nil,
      @quote_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @apply_cancellation_charges
        params << {"#{prefix}ApplyCancellationCharges", value.to_json_object_key}
      end

      if value = @quote_id
        params << {"#{prefix}QuoteId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        apply_cancellation_charges: (n = node.xpath_node("*[local-name()='ApplyCancellationCharges']")) ? AEC::ApplyCancellationCharges.from_json_object_key?(n.content) : nil,
        quote_id: Core::XMLValue.string(node.xpath_node("*[local-name()='QuoteId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @dry_run, @apply_cancellation_charges, @quote_id)
  end
end
