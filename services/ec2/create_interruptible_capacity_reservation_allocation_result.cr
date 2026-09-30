private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInterruptibleCapacityReservationAllocationResult
    # The ID of the source Capacity Reservation from which the interruptible Capacity Reservation was
    # created.
    property source_capacity_reservation_id : String | Nil

    # The number of instances allocated to the interruptible reservation.
    property target_instance_count : Int32 | Nil

    # The current status of the allocation request (creating, active, updating).
    property status : InterruptibleCapacityReservationAllocationStatus | Nil

    # The type of interruption applied to the interruptible reservation.
    property interruption_type : InterruptionType | Nil

    def initialize(
      @source_capacity_reservation_id : String | Nil = nil,
      @target_instance_count : Int32 | Nil = nil,
      @status : InterruptibleCapacityReservationAllocationStatus | Nil = nil,
      @interruption_type : InterruptionType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_capacity_reservation_id
        params << {"#{prefix}SourceCapacityReservationId", value}
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
        source_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCapacityReservationId']")),
        target_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetInstanceCount']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::InterruptibleCapacityReservationAllocationStatus.from_json_object_key?(n.content) : nil,
        interruption_type: (n = node.xpath_node("*[local-name()='interruptionType']")) ? AEC::InterruptionType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_capacity_reservation_id, @target_instance_count, @status, @interruption_type)
  end
end
