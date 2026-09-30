private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the instance topology.
  class InstanceTopology
    # The instance ID.
    property instance_id : String | Nil

    # The instance type.
    property instance_type : String | Nil

    # The name of the placement group that the instance is in.
    property group_name : String | Nil

    # The network nodes. The nodes are hashed based on your account. Instances from different accounts
    # running under the same server will return a different hashed list of strings.
    #
    # The value is `null` or empty if:
    #
    # - The instance type is not supported.
    #
    # - The instance is in a state other than `running`.
    property network_nodes : Array(String) | Nil

    # The name of the Availability Zone or Local Zone that the instance is in.
    property availability_zone : String | Nil

    # The ID of the Availability Zone or Local Zone that the instance is in.
    property zone_id : String | Nil

    # The ID of the Capacity Block. This parameter is only supported for UltraServer instances and
    # identifies instances within the UltraServer domain.
    property capacity_block_id : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @group_name : String | Nil = nil,
      @network_nodes : Array(String) | Nil = nil,
      @availability_zone : String | Nil = nil,
      @zone_id : String | Nil = nil,
      @capacity_block_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
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

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @zone_id
        params << {"#{prefix}ZoneId", value}
      end

      if value = @capacity_block_id
        params << {"#{prefix}CapacityBlockId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        network_nodes: node.xpath_nodes("*[local-name()='networkNodeSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneId']")),
        capacity_block_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @instance_type, @group_name, @network_nodes, @availability_zone, @zone_id, @capacity_block_id)
  end
end
