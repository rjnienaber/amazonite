private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the Capacity Reservation topology.
  class CapacityReservationTopology
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The ID of the Capacity Block. This parameter is only supported for UltraServer instances and
    # identifies instances within the UltraServer domain.
    property capacity_block_id : String | Nil

    # The current state of the Capacity Reservation. For the list of possible states, see
    # [DescribeCapacityReservations](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeCapacityReservations.html).
    property state : String | Nil

    # The instance type.
    property instance_type : String | Nil

    # The name of the placement group that the Capacity Reservation is in.
    property group_name : String | Nil

    # The network nodes. The nodes are hashed based on your account. Capacity Reservations from
    # different accounts running under the same server will return a different hashed list of strings.
    #
    # The value is `null` or empty if:
    #
    # - The instance type is not supported.
    #
    # - The Capacity Reservation is in a state other than `active` or `pending`.
    property network_nodes : Array(String) | Nil

    # The ID of the Availability Zone or Local Zone that the Capacity Reservation is in.
    property availability_zone_id : String | Nil

    # The name of the Availability Zone or Local Zone that the Capacity Reservation is in.
    property availability_zone : String | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @capacity_block_id : String | Nil = nil,
      @state : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @group_name : String | Nil = nil,
      @network_nodes : Array(String) | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      (@network_nodes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkNodeSet.#{i}", item}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        network_nodes: node.xpath_nodes("*[local-name()='networkNodeSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @capacity_block_id, @state, @instance_type, @group_name, @network_nodes, @availability_zone_id, @availability_zone)
  end
end
