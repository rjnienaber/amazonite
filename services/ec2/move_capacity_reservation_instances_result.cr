private alias Core = Amazonite::Core

module Amazonite::EC2
  class MoveCapacityReservationInstancesResult
    # Information about the source Capacity Reservation.
    property source_capacity_reservation : CapacityReservation | Nil

    # Information about the destination Capacity Reservation.
    property destination_capacity_reservation : CapacityReservation | Nil

    # The number of instances that were moved from the source Capacity Reservation to the destination
    # Capacity Reservation.
    property instance_count : Int32 | Nil

    def initialize(
      @source_capacity_reservation : CapacityReservation | Nil = nil,
      @destination_capacity_reservation : CapacityReservation | Nil = nil,
      @instance_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_capacity_reservation
        params.concat(value.to_query_params("#{prefix}SourceCapacityReservation."))
      end

      if value = @destination_capacity_reservation
        params.concat(value.to_query_params("#{prefix}DestinationCapacityReservation."))
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_capacity_reservation: node.xpath_node("*[local-name()='sourceCapacityReservation']").try { |n| CapacityReservation.from_xml(n) },
        destination_capacity_reservation: node.xpath_node("*[local-name()='destinationCapacityReservation']").try { |n| CapacityReservation.from_xml(n) },
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
      )
    end

    def validate! : Nil
      if value = @source_capacity_reservation
        value.validate!
      end

      if value = @destination_capacity_reservation
        value.validate!
      end
    end

    def_equals_and_hash(@source_capacity_reservation, @destination_capacity_reservation, @instance_count)
  end
end
