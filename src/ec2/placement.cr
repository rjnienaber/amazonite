private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the placement of an instance.
  class Placement
    # The ID of the Availability Zone of the instance.
    #
    # On input, you can specify `AvailabilityZone` or `AvailabilityZoneId`, but not both. If you
    # specify neither one, Amazon EC2 automatically selects an Availability Zone for you.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet).
    property availability_zone_id : String | Nil

    # The affinity setting for the instance on the Dedicated Host.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet) or
    # [ImportInstance](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ImportInstance.html).
    property affinity : String | Nil

    # The name of the placement group that the instance is in.
    #
    # On input, you can specify `GroupId` or `GroupName`, but not both.
    property group_name : String | Nil

    # The number of the partition that the instance is in. Valid only if the placement group strategy
    # is set to `partition`.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet).
    property partition_number : Int32 | Nil

    # The ID of the Dedicated Host on which the instance resides.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet) or
    # [ImportInstance](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ImportInstance.html).
    property host_id : String | Nil

    # The tenancy of the instance. An instance with a tenancy of `dedicated` runs on single-tenant
    # hardware.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet). The
    # `host` tenancy is not supported for
    # [ImportInstance](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ImportInstance.html)
    # or for T3 instances that are configured for the `unlimited` CPU credit option.
    property tenancy : Tenancy | Nil

    # Reserved for future use.
    property spread_domain : String | Nil

    # The ARN of the host resource group in which to launch the instances.
    #
    # On input, if you specify this parameter, either omit the **Tenancy** parameter or set it to
    # `host`.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet).
    property host_resource_group_arn : String | Nil

    # The ID of the placement group that the instance is in.
    #
    # On input, you can specify `GroupId` or `GroupName`, but not both.
    property group_id : String | Nil

    # The Availability Zone of the instance.
    #
    # On input, you can specify `AvailabilityZone` or `AvailabilityZoneId`, but not both. If you
    # specify neither one, Amazon EC2 automatically selects an Availability Zone for you.
    #
    # This parameter is not supported for
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet).
    property availability_zone : String | Nil

    def initialize(
      @availability_zone_id : String | Nil = nil,
      @affinity : String | Nil = nil,
      @group_name : String | Nil = nil,
      @partition_number : Int32 | Nil = nil,
      @host_id : String | Nil = nil,
      @tenancy : Tenancy | Nil = nil,
      @spread_domain : String | Nil = nil,
      @host_resource_group_arn : String | Nil = nil,
      @group_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @affinity
        params << {"#{prefix}Affinity", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @partition_number
        params << {"#{prefix}PartitionNumber", value.to_s}
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

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        affinity: Core::XMLValue.string(node.xpath_node("*[local-name()='affinity']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        partition_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='partitionNumber']")),
        host_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostId']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        spread_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='spreadDomain']")),
        host_resource_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='hostResourceGroupArn']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone_id, @affinity, @group_name, @partition_number, @host_id, @tenancy, @spread_domain, @host_resource_group_arn, @group_id, @availability_zone)
  end
end
