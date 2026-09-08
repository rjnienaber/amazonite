private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the placement of an instance.
  class LaunchTemplatePlacementRequest
    # The Availability Zone for the instance.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone : String | Nil

    # The ID of the Availability Zone for the instance.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone_id : String | Nil

    # The affinity setting for an instance on a Dedicated Host.
    property affinity : String | Nil

    # The name of the placement group for the instance.
    property group_name : String | Nil

    # The ID of the Dedicated Host for the instance.
    property host_id : String | Nil

    # The tenancy of the instance. An instance with a tenancy of dedicated runs on single-tenant
    # hardware.
    property tenancy : Tenancy | Nil

    # Reserved for future use.
    property spread_domain : String | Nil

    # The ARN of the host resource group in which to launch the instances. If you specify a host
    # resource group ARN, omit the **Tenancy** parameter or set it to `host`.
    property host_resource_group_arn : String | Nil

    # The number of the partition the instance should launch in. Valid only if the placement group
    # strategy is set to `partition`.
    property partition_number : Int32 | Nil

    # The Group Id of a placement group. You must specify the Placement Group **Group Id** to launch
    # an instance in a shared placement group.
    property group_id : String | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @affinity : String | Nil = nil,
      @group_name : String | Nil = nil,
      @host_id : String | Nil = nil,
      @tenancy : Tenancy | Nil = nil,
      @spread_domain : String | Nil = nil,
      @host_resource_group_arn : String | Nil = nil,
      @partition_number : Int32 | Nil = nil,
      @group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @affinity
        params << {"#{prefix}Affinity", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @host_id
        params << {"#{prefix}HostId", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @spread_domain
        params << {"#{prefix}SpreadDomain", value}
      end

      if value = @host_resource_group_arn
        params << {"#{prefix}HostResourceGroupArn", value}
      end

      if value = @partition_number
        params << {"#{prefix}PartitionNumber", value.to_s}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        affinity: Core::XMLValue.string(node.xpath_node("*[local-name()='Affinity']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        host_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HostId']")),
        tenancy: (n = node.xpath_node("*[local-name()='Tenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        spread_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='SpreadDomain']")),
        host_resource_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='HostResourceGroupArn']")),
        partition_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='PartitionNumber']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @affinity, @group_name, @host_id, @tenancy, @spread_domain, @host_resource_group_arn, @partition_number, @group_id)
  end
end
