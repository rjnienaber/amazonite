private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class UpdateInterruptibleCapacityReservationAllocationResult
    # The ID of the interruptible Capacity Reservation that was modified.
    property interruptible_capacity_reservation_id : String | Nil

    # The ID of the source Capacity Reservation to which capacity was reclaimed or from which capacity
    # was allocated.
    property source_capacity_reservation_id : String | Nil

    # The current number of instances allocated to the interruptible reservation.
    property instance_count : Int32 | Nil

    # The requested number of instances for the interruptible Capacity Reservation.
    property target_instance_count : Int32 | Nil

    # The current status of the allocation (updating during reclamation, active when complete).
    property status : InterruptibleCapacityReservationAllocationStatus | Nil

    # The interruption type for the interruptible reservation.
    property interruption_type : InterruptionType | Nil

    def initialize(
      @interruptible_capacity_reservation_id : String | Nil = nil,
      @source_capacity_reservation_id : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @target_instance_count : Int32 | Nil = nil,
      @status : InterruptibleCapacityReservationAllocationStatus | Nil = nil,
      @interruption_type : InterruptionType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @interruptible_capacity_reservation_id
        params << {"#{prefix}InterruptibleCapacityReservationId", value}
      end

      if value = @source_capacity_reservation_id
        params << {"#{prefix}SourceCapacityReservationId", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @target_instance_count
        params << {"#{prefix}TargetInstanceCount", value.to_s}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @interruption_type
        params << {"#{prefix}InterruptionType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        interruptible_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='interruptibleCapacityReservationId']")),
        source_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCapacityReservationId']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        target_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetInstanceCount']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::InterruptibleCapacityReservationAllocationStatus.from_json_object_key?(n.content) : nil,
        interruption_type: (n = node.xpath_node("*[local-name()='interruptionType']")) ? AEC::InterruptionType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@interruptible_capacity_reservation_id, @source_capacity_reservation_id, @instance_count, @target_instance_count, @status, @interruption_type)
  end
end
