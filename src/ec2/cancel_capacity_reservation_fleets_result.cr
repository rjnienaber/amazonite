private alias Core = Amazonite::Core

module Amazonite::EC2
  class CancelCapacityReservationFleetsResult
    # Information about the Capacity Reservation Fleets that were successfully cancelled.
    property successful_fleet_cancellations : Array(CapacityReservationFleetCancellationState) | Nil

    # Information about the Capacity Reservation Fleets that could not be cancelled.
    property failed_fleet_cancellations : Array(FailedCapacityReservationFleetCancellationResult) | Nil

    def initialize(
      @successful_fleet_cancellations : Array(CapacityReservationFleetCancellationState) | Nil = nil,
      @failed_fleet_cancellations : Array(FailedCapacityReservationFleetCancellationResult) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_fleet_cancellations || [] of CapacityReservationFleetCancellationState).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulFleetCancellationSet.#{i}."))
      end

      (@failed_fleet_cancellations || [] of FailedCapacityReservationFleetCancellationResult).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FailedFleetCancellationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_fleet_cancellations: node.xpath_nodes("*[local-name()='successfulFleetCancellationSet']/*[local-name()='item']").map { |n| CapacityReservationFleetCancellationState.from_xml(n) },
        failed_fleet_cancellations: node.xpath_nodes("*[local-name()='failedFleetCancellationSet']/*[local-name()='item']").map { |n| FailedCapacityReservationFleetCancellationResult.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_fleet_cancellations
        value.each(&.validate!)
      end

      if value = @failed_fleet_cancellations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_fleet_cancellations, @failed_fleet_cancellations)
  end
end
