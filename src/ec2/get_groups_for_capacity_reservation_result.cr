private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetGroupsForCapacityReservationResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the resource groups to which the Capacity Reservation has been added.
    property capacity_reservation_groups : Array(CapacityReservationGroup) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @capacity_reservation_groups : Array(CapacityReservationGroup) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@capacity_reservation_groups || [] of CapacityReservationGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CapacityReservationGroupSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        capacity_reservation_groups: node.xpath_nodes("*[local-name()='capacityReservationGroupSet']/*[local-name()='item']").map { |n| CapacityReservationGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @capacity_reservation_groups)
  end
end
