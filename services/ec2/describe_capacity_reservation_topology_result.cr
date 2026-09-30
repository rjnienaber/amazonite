private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationTopologyResult
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the topology of each Capacity Reservation.
    property capacity_reservations : Array(CapacityReservationTopology) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @capacity_reservations : Array(CapacityReservationTopology) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@capacity_reservations || [] of CapacityReservationTopology).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        capacity_reservations: node.xpath_nodes("*[local-name()='capacityReservationSet']/*[local-name()='item']").map { |n| CapacityReservationTopology.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @capacity_reservations)
  end
end
