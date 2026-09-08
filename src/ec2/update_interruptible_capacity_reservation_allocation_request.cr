private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class UpdateInterruptibleCapacityReservationAllocationRequest
    # The ID of the source Capacity Reservation containing the interruptible allocation to modify.
    property capacity_reservation_id : String

    # The new number of instances to allocate. Enter a higher number to add more capacity to share, or
    # a lower number to reclaim capacity to your source Capacity Reservation.
    property target_instance_count : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response.
    property dry_run : Bool | Nil

    # Specifies the updated behavior for the interruptible Capacity Reservation when you reduce its
    # allocation to zero instances. Specify `retain` to keep the interruptible Capacity Reservation
    # active at zero capacity so that you can allocate instances to it again later. Specify `default`
    # to cancel the interruptible Capacity Reservation and return the capacity to your source Capacity
    # Reservation.
    property zero_size_preference : ZeroSizePreference | Nil

    def initialize(
      @capacity_reservation_id : String,
      @target_instance_count : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @zero_size_preference : ZeroSizePreference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      if value = @target_instance_count
        params << {"#{prefix}TargetInstanceCount", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @zero_size_preference
        params << {"#{prefix}ZeroSizePreference", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        target_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='TargetInstanceCount']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        zero_size_preference: (n = node.xpath_node("*[local-name()='ZeroSizePreference']")) ? AEC::ZeroSizePreference.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @target_instance_count, @dry_run, @zero_size_preference)
  end
end
