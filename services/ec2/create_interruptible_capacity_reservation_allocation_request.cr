private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInterruptibleCapacityReservationAllocationRequest
    # The ID of the source Capacity Reservation from which to create the interruptible Capacity
    # Reservation. Your Capacity Reservation must be in active state with no end date set and have
    # available capacity for allocation.
    property capacity_reservation_id : String

    # The number of instances to allocate from your source reservation. You can only allocate
    # available instances (also called unused capacity).
    property instance_count : Int32

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response.
    property dry_run : Bool | Nil

    # The tags to apply to the interruptible Capacity Reservation during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Specifies the behavior for the interruptible Capacity Reservation when you reduce its allocation
    # to zero instances. Specify `retain` to keep the interruptible Capacity Reservation active at
    # zero capacity so that you can allocate instances to it again later. Specify `default` to cancel
    # the interruptible Capacity Reservation and return the capacity to your source Capacity
    # Reservation. The default value is `default`.
    property zero_size_preference : ZeroSizePreference | Nil

    def initialize(
      @capacity_reservation_id : String,
      @instance_count : Int32,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @zero_size_preference : ZeroSizePreference | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityReservationId", @capacity_reservation_id}

      params << {"#{prefix}InstanceCount", @instance_count.to_s}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @zero_size_preference
        params << {"#{prefix}ZeroSizePreference", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationId']")).not_nil!,
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='InstanceCount']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        zero_size_preference: (n = node.xpath_node("*[local-name()='ZeroSizePreference']")) ? AEC::ZeroSizePreference.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_id, @instance_count, @client_token, @dry_run, @tag_specifications, @zero_size_preference)
  end
end
