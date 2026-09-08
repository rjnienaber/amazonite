private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstancePlacementRequest
    # The name of the placement group in which to place the instance. For spread placement groups, the
    # instance must have a tenancy of `default`. For cluster and partition placement groups, the
    # instance must have a tenancy of `default` or `dedicated`.
    #
    # To remove an instance from a placement group, specify an empty string ("").
    property group_name : String | Nil

    # The number of the partition in which to place the instance. Valid only if the placement group
    # strategy is set to `partition`.
    property partition_number : Int32 | Nil

    # The ARN of the host resource group in which to place the instance. The instance must have a
    # tenancy of `host` to specify this parameter.
    property host_resource_group_arn : String | Nil

    # The Group Id of a placement group. You must specify the Placement Group **Group Id** to launch
    # an instance in a shared placement group.
    property group_id : String | Nil

    # The ID of the instance that you are modifying.
    property instance_id : String

    # The tenancy for the instance.
    #
    # For T3 instances, you must launch the instance on a Dedicated Host to use a tenancy of `host`.
    # You can't change the tenancy from `host` to `dedicated` or `default`. Attempting to make one of
    # these unsupported tenancy changes results in an `InvalidRequest` error code.
    property tenancy : HostTenancy | Nil

    # The affinity setting for the instance. For more information, see [Host
    # affinity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/how-dedicated-hosts-work.html#dedicated-hosts-affinity)
    # in the *Amazon EC2 User Guide*.
    property affinity : Affinity | Nil

    # The ID of the Dedicated Host with which to associate the instance.
    property host_id : String | Nil

    def initialize(
      @instance_id : String,
      @group_name : String | Nil = nil,
      @partition_number : Int32 | Nil = nil,
      @host_resource_group_arn : String | Nil = nil,
      @group_id : String | Nil = nil,
      @tenancy : HostTenancy | Nil = nil,
      @affinity : Affinity | Nil = nil,
      @host_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @partition_number
        params << {"#{prefix}PartitionNumber", value.to_s}
      end

      if value = @host_resource_group_arn
        params << {"#{prefix}HostResourceGroupArn", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @affinity
        params << {"#{prefix}Affinity", value.to_json_object_key}
      end

      if value = @host_id
        params << {"#{prefix}HostId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        partition_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='PartitionNumber']")),
        host_resource_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='HostResourceGroupArn']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::HostTenancy.from_json_object_key?(n.content) : nil,
        affinity: (n = node.xpath_node("*[local-name()='affinity']")) ? AEC::Affinity.from_json_object_key?(n.content) : nil,
        host_id: Core::XMLValue.string(node.xpath_node("*[local-name()='hostId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_name, @partition_number, @host_resource_group_arn, @group_id, @instance_id, @tenancy, @affinity, @host_id)
  end
end
