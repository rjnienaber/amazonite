private alias Core = Amazonite::Core

module Amazonite::EC2
  class PurchaseCapacityBlockResult
    # The Capacity Reservation.
    property capacity_reservation : CapacityReservation | Nil

    # The Capacity Block.
    property capacity_blocks : Array(CapacityBlock) | Nil

    def initialize(
      @capacity_reservation : CapacityReservation | Nil = nil,
      @capacity_blocks : Array(CapacityBlock) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation
        params.concat(value.to_query_params("#{prefix}CapacityReservation."))
      end

      (@capacity_blocks || [] of CapacityBlock).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityBlockSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation: node.xpath_node("*[local-name()='capacityReservation']").try { |n| CapacityReservation.from_xml(n) },
        capacity_blocks: node.xpath_nodes("*[local-name()='capacityBlockSet']/*[local-name()='item']").map { |n| CapacityBlock.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation
        value.validate!
      end

      if value = @capacity_blocks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation, @capacity_blocks)
  end
end
