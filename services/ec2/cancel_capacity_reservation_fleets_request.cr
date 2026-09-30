private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelCapacityReservationFleetsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Capacity Reservation Fleets to cancel.
    property capacity_reservation_fleet_ids : Array(String) = [] of String

    def initialize(
      @capacity_reservation_fleet_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @capacity_reservation_fleet_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationFleetId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        capacity_reservation_fleet_ids: node.xpath_nodes("*[local-name()='CapacityReservationFleetId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @capacity_reservation_fleet_ids)
  end
end
