private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about instance capacity usage for a Capacity Reservation.
  class CapacityAllocation
    # The usage type. `used` indicates that the instance capacity is in use by instances that are
    # running in the Capacity Reservation.
    property allocation_type : AllocationType | Nil

    # The amount of instance capacity associated with the usage. For example a value of `4` indicates
    # that instance capacity for 4 instances is currently in use.
    property count : Int32 | Nil

    # Additional metadata associated with the capacity allocation. Each entry contains a key-value
    # pair providing context about the allocation.
    property allocation_metadata : Array(CapacityAllocationMetadataEntry) | Nil

    def initialize(
      @allocation_type : AllocationType | Nil = nil,
      @count : Int32 | Nil = nil,
      @allocation_metadata : Array(CapacityAllocationMetadataEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_type
        params << {"#{prefix}AllocationType", value.to_json_object_key}
      end

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      (@allocation_metadata || [] of CapacityAllocationMetadataEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllocationMetadataList.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_type: (n = node.xpath_node("*[local-name()='allocationType']")) ? AEC::AllocationType.from_json_object_key?(n.content) : nil,
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        allocation_metadata: node.xpath_nodes("*[local-name()='allocationMetadataList']/*[local-name()='item']").map { |n| CapacityAllocationMetadataEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @allocation_metadata
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@allocation_type, @count, @allocation_metadata)
  end
end
