private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCapacityReservationFleetsResult
    # Information about the Capacity Reservation Fleets.
    property capacity_reservation_fleets : Array(CapacityReservationFleet) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @capacity_reservation_fleets : Array(CapacityReservationFleet) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_reservation_fleets || [] of CapacityReservationFleet).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationFleetSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleets: node.xpath_nodes("*[local-name()='capacityReservationFleetSet']/*[local-name()='item']").map { |n| CapacityReservationFleet.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_fleets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_fleets, @next_token)
  end
end
