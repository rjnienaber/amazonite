module Amazonite::EC2
  # Describes the target Capacity Reservations or Capacity Reservation Resource Groups for an EC2
  # Fleet that launches into reserved capacity. You can specify Capacity Reservation IDs or a
  # Capacity Reservation Resource Group ARN, but not both.
  class FleetCapacityReservationTargetRequest
    # The IDs of the Capacity Reservations in which to launch the instances.
    property capacity_reservation_ids : Array(String) | Nil

    # The ARNs of the Capacity Reservation Resource Groups in which to launch the instances.
    property capacity_reservation_resource_group_arns : Array(String) | Nil

    def initialize(
      @capacity_reservation_ids : Array(String) | Nil = nil,
      @capacity_reservation_resource_group_arns : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@capacity_reservation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationId.#{i}", item}
      end

      (@capacity_reservation_resource_group_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CapacityReservationResourceGroupArn.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_ids: node.xpath_nodes("*[local-name()='CapacityReservationId']/*[local-name()='item']").map { |n| n.content },
        capacity_reservation_resource_group_arns: node.xpath_nodes("*[local-name()='CapacityReservationResourceGroupArn']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_ids, @capacity_reservation_resource_group_arns)
  end
end
