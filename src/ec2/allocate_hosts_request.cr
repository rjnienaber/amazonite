private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class AllocateHostsRequest
    # Specifies the instance family to be supported by the Dedicated Hosts. If you specify an instance
    # family, the Dedicated Hosts support multiple instance types within that instance family.
    #
    # If you want the Dedicated Hosts to support a specific instance type only, omit this parameter
    # and specify **InstanceType** instead. You cannot specify **InstanceFamily** and **InstanceType**
    # in the same request.
    property instance_family : String | Nil

    # The tags to apply to the Dedicated Host during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Indicates whether to enable or disable host recovery for the Dedicated Host. Host recovery is
    # disabled by default. For more information, see [ Host
    # recovery](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-recovery.html) in
    # the *Amazon EC2 User Guide*.
    #
    # Default: `off`
    property host_recovery : HostRecovery | Nil

    # The Amazon Resource Name (ARN) of the Amazon Web Services Outpost on which to allocate the
    # Dedicated Host. If you specify **OutpostArn**, you can optionally specify **AssetIds**.
    #
    # If you are allocating the Dedicated Host in a Region, omit this parameter.
    property outpost_arn : String | Nil

    # Indicates whether to enable or disable host maintenance for the Dedicated Host. For more
    # information, see [Host
    # maintenance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-maintenance.html)
    # in the *Amazon EC2 User Guide*.
    property host_maintenance : HostMaintenance | Nil

    # The IDs of the Outpost hardware assets on which to allocate the Dedicated Hosts. Targeting
    # specific hardware assets on an Outpost can help to minimize latency between your workloads. This
    # parameter is supported only if you specify **OutpostArn**. If you are allocating the Dedicated
    # Hosts in a Region, omit this parameter.
    #
    # - If you specify this parameter, you can omit **Quantity**. In this case, Amazon EC2 allocates a
    # Dedicated Host on each specified hardware asset.
    #
    # - If you specify both **AssetIds** and **Quantity**, then the value for **Quantity** must be
    # equal to the number of asset IDs specified.
    property asset_ids : Array(String) | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The CPU configuration options to apply to the Dedicated Host.
    property cpu_options : HostCpuOptionsRequest | Nil

    # Indicates whether the host accepts any untargeted instance launches that match its instance type
    # configuration, or if it only accepts Host tenancy instance launches that specify its unique host
    # ID. For more information, see [ Understanding auto-placement and
    # affinity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/how-dedicated-hosts-work.html#dedicated-hosts-understanding)
    # in the *Amazon EC2 User Guide*.
    #
    # Default: `off`
    property auto_placement : AutoPlacement | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Specifies the instance type to be supported by the Dedicated Hosts. If you specify an instance
    # type, the Dedicated Hosts support instances of the specified instance type only.
    #
    # If you want the Dedicated Hosts to support multiple instance types in a specific instance
    # family, omit this parameter and specify **InstanceFamily** instead. You cannot specify
    # **InstanceType** and **InstanceFamily** in the same request.
    property instance_type : String | Nil

    # The number of Dedicated Hosts to allocate to your account with these parameters. If you are
    # allocating the Dedicated Hosts on an Outpost, and you specify **AssetIds**, you can omit this
    # parameter. In this case, Amazon EC2 allocates a Dedicated Host on each specified hardware asset.
    # If you specify both **AssetIds** and **Quantity**, then the value that you specify for
    # **Quantity** must be equal to the number of asset IDs specified.
    property quantity : Int32 | Nil

    # The Availability Zone in which to allocate the Dedicated Host.
    property availability_zone : String | Nil

    def initialize(
      @instance_family : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @host_recovery : HostRecovery | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @host_maintenance : HostMaintenance | Nil = nil,
      @asset_ids : Array(String) | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @cpu_options : HostCpuOptionsRequest | Nil = nil,
      @auto_placement : AutoPlacement | Nil = nil,
      @client_token : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @quantity : Int32 | Nil = nil,
      @availability_zone : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_family
        params << {"#{prefix}InstanceFamily", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @host_recovery
        params << {"#{prefix}HostRecovery", value.to_json_object_key}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @host_maintenance
        params << {"#{prefix}HostMaintenance", value.to_json_object_key}
      end

      (@asset_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssetId.#{i}", item}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @cpu_options
        params.concat(value.to_query_params("#{prefix}CpuOptions."))
      end

      if value = @auto_placement
        params << {"#{prefix}AutoPlacement", value.to_json_object_key}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @quantity
        params << {"#{prefix}Quantity", value.to_s}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_family: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceFamily']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        host_recovery: (n = node.xpath_node("*[local-name()='HostRecovery']")) ? AEC::HostRecovery.from_json_object_key?(n.content) : nil,
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        host_maintenance: (n = node.xpath_node("*[local-name()='HostMaintenance']")) ? AEC::HostMaintenance.from_json_object_key?(n.content) : nil,
        asset_ids: node.xpath_nodes("*[local-name()='AssetId']/*[local-name()='item']").map { |n| n.content },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        cpu_options: node.xpath_node("*[local-name()='CpuOptions']").try { |n| HostCpuOptionsRequest.from_xml(n) },
        auto_placement: (n = node.xpath_node("*[local-name()='autoPlacement']")) ? AEC::AutoPlacement.from_json_object_key?(n.content) : nil,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        quantity: Core::XMLValue.i32(node.xpath_node("*[local-name()='quantity']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @cpu_options
        value.validate!
      end
    end

    def_equals_and_hash(@instance_family, @tag_specifications, @host_recovery, @outpost_arn, @host_maintenance, @asset_ids, @availability_zone_id, @cpu_options, @auto_placement, @client_token, @instance_type, @quantity, @availability_zone)
  end
end
