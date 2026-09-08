private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Represents the allocation of capacity from a source reservation to an interruptible reservation,
  # tracking current and target instance counts for allocation management.
  class InterruptibleCapacityAllocation
    # The current number of instances allocated to the interruptible reservation.
    property instance_count : Int32 | Nil

    # After your modify request, the requested number of instances allocated to interruptible
    # reservation.
    property target_instance_count : Int32 | Nil

    # The current status of the allocation (updating during reclamation, active when complete).
    property status : InterruptibleCapacityReservationAllocationStatus | Nil

    # The ID of the interruptible Capacity Reservation created from the allocation.
    property interruptible_capacity_reservation_id : String | Nil

    # The type of interruption policy applied to the interruptible reservation.
    property interruption_type : InterruptionType | Nil

    # Specifies how Amazon EC2 handles the interruptible Capacity Reservation when you reduce its
    # allocation to zero instances. A value of `retain` keeps the interruptible Capacity Reservation
    # active at zero capacity so that you can allocate instances to it again later. A value of
    # `default` cancels the interruptible Capacity Reservation and returns the capacity to your source
    # Capacity Reservation.
    property zero_size_preference : ZeroSizePreference | Nil

    def initialize(
      @instance_count : Int32 | Nil = nil,
      @target_instance_count : Int32 | Nil = nil,
      @status : InterruptibleCapacityReservationAllocationStatus | Nil = nil,
      @interruptible_capacity_reservation_id : String | Nil = nil,
      @interruption_type : InterruptionType | Nil = nil,
      @zero_size_preference : ZeroSizePreference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @target_instance_count
        params << {"#{prefix}TargetInstanceCount", value.to_s}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @interruptible_capacity_reservation_id
        params << {"#{prefix}InterruptibleCapacityReservationId", value}
      end

      if value = @interruption_type
        params << {"#{prefix}InterruptionType", value.to_json_object_key}
      end

      if value = @zero_size_preference
        params << {"#{prefix}ZeroSizePreference", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        target_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetInstanceCount']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::InterruptibleCapacityReservationAllocationStatus.from_json_object_key?(n.content) : nil,
        interruptible_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='interruptibleCapacityReservationId']")),
        interruption_type: (n = node.xpath_node("*[local-name()='interruptionType']")) ? AEC::InterruptionType.from_json_object_key?(n.content) : nil,
        zero_size_preference: (n = node.xpath_node("*[local-name()='zeroSizePreference']")) ? AEC::ZeroSizePreference.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @target_instance_count, @status, @interruptible_capacity_reservation_id, @interruption_type, @zero_size_preference)
  end
end
