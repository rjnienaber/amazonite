private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the availability of capacity for a Capacity Block.
  class CapacityBlockStatus
    # The ID of the Capacity Block.
    property capacity_block_id : String | Nil

    # The status of the high-bandwidth accelerator interconnect. Possible states include:
    #
    # - `ok` the accelerator interconnect is healthy.
    #
    # - `impaired` - accelerator interconnect communication is impaired.
    #
    # - `insufficient-data` - insufficient data to determine accelerator interconnect status.
    property interconnect_status : CapacityBlockInterconnectStatus | Nil

    # The combined amount of `Available` and `Unavailable` capacity in the Capacity Block.
    property total_capacity : Int32 | Nil

    # The remaining capacity. Indicates the number of resources that can be launched into the Capacity
    # Block.
    property total_available_capacity : Int32 | Nil

    # The unavailable capacity. Indicates the instance capacity that is unavailable for use due to a
    # system status check failure.
    property total_unavailable_capacity : Int32 | Nil

    # The availability of capacity for the Capacity Block reservations.
    property capacity_reservation_statuses : Array(CapacityReservationStatus) | Nil

    def initialize(
      @capacity_block_id : String | Nil = nil,
      @interconnect_status : CapacityBlockInterconnectStatus | Nil = nil,
      @total_capacity : Int32 | Nil = nil,
      @total_available_capacity : Int32 | Nil = nil,
      @total_unavailable_capacity : Int32 | Nil = nil,
      @capacity_reservation_statuses : Array(CapacityReservationStatus) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end

      if value = @interconnect_status
        params << {"#{prefix}InterconnectStatus", value.to_json_object_key}
      end

      if value = @total_capacity
        params << {"#{prefix}TotalCapacity", value.to_s}
      end

      if value = @total_available_capacity
        params << {"#{prefix}TotalAvailableCapacity", value.to_s}
      end

      if value = @total_unavailable_capacity
        params << {"#{prefix}TotalUnavailableCapacity", value.to_s}
      end

      (@capacity_reservation_statuses || [] of CapacityReservationStatus).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationStatusSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
        interconnect_status: (n = node.xpath_node("*[local-name()='interconnectStatus']")) ? AEC::CapacityBlockInterconnectStatus.from_json_object_key?(n.content) : nil,
        total_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalCapacity']")),
        total_available_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalAvailableCapacity']")),
        total_unavailable_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalUnavailableCapacity']")),
        capacity_reservation_statuses: node.xpath_nodes("*[local-name()='capacityReservationStatusSet']/*[local-name()='item']").map { |n| CapacityReservationStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_block_id, @interconnect_status, @total_capacity, @total_available_capacity, @total_unavailable_capacity, @capacity_reservation_statuses)
  end
end
