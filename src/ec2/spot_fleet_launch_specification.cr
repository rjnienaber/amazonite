private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the launch specification for one or more Spot Instances. If you include On-Demand
  # capacity in your fleet request or want to specify an EFA network device, you can't use
  # `SpotFleetLaunchSpecification`; you must use
  # [LaunchTemplateConfig](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_LaunchTemplateConfig.html).
  class SpotFleetLaunchSpecification
    # Deprecated.
    property addressing_type : String | Nil

    # One or more block devices that are mapped to the Spot Instances. You can't specify both a
    # snapshot ID and an encryption value. This is because only blank volumes can be encrypted on
    # creation. If a snapshot is the basis for a volume, it is not blank and its encryption status is
    # used for the volume encryption status.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    # Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated
    # throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O
    # performance. This optimization isn't available with all instance types. Additional usage charges
    # apply when using an EBS Optimized instance.
    #
    # Default: `false`
    property ebs_optimized : Bool | Nil

    # The IAM instance profile.
    property iam_instance_profile : IamInstanceProfileSpecification | Nil

    # The ID of the AMI.
    property image_id : String | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # The ID of the kernel.
    property kernel_id : String | Nil

    # The name of the key pair.
    property key_name : String | Nil

    # Enable or disable monitoring for the instances.
    property monitoring : SpotFleetMonitoring | Nil

    # The network interfaces.
    #
    # `SpotFleetLaunchSpecification` does not support Elastic Fabric Adapter (EFA). You must use
    # [LaunchTemplateConfig](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_LaunchTemplateConfig.html)
    # instead.
    property network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil

    # The placement information.
    property placement : SpotPlacement | Nil

    # The ID of the RAM disk. Some kernels require additional drivers at launch. Check the kernel
    # requirements for information about whether you need to specify a RAM disk. To find kernel
    # requirements, refer to the Amazon Web Services Resource Center and search for the kernel ID.
    property ramdisk_id : String | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # The IDs of the subnets in which to launch the instances. To specify multiple subnets, separate
    # them using commas; for example, "subnet-1234abcdeexample1, subnet-0987cdef6example2".
    #
    # If you specify a network interface, you must specify any subnets as part of the network
    # interface instead of using this parameter.
    property subnet_id : String | Nil

    # The base64-encoded user data that instances use when starting up. User data is limited to 16 KB.
    property user_data : String | Nil

    # The number of units provided by the specified instance type. These are the same units that you
    # chose to set the target capacity in terms of instances, or a performance characteristic such as
    # vCPUs, memory, or I/O.
    #
    # If the target capacity divided by this value is not a whole number, Amazon EC2 rounds the number
    # of instances to the next whole number. If this value is not specified, the default is 1.
    #
    # When specifying weights, the price used in the `lowestPrice` and `priceCapacityOptimized`
    # allocation strategies is per *unit* hour (where the instance price is divided by the specified
    # weight). However, if all the specified weights are above the requested `TargetCapacity`,
    # resulting in only 1 instance being launched, the price used is per *instance* hour.
    property weighted_capacity : Float64 | Nil

    # The tags to apply during creation.
    property tag_specifications : Array(SpotFleetTagSpecification) | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with those attributes.
    #
    # If you specify `InstanceRequirements`, you can't specify `InstanceType`.
    property instance_requirements : InstanceRequirements | Nil

    # The security groups.
    #
    # If you specify a network interface, you must specify any security groups as part of the network
    # interface instead of using this parameter.
    property security_groups : Array(GroupIdentifier) | Nil

    def initialize(
      @addressing_type : String | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
      @ebs_optimized : Bool | Nil = nil,
      @iam_instance_profile : IamInstanceProfileSpecification | Nil = nil,
      @image_id : String | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @kernel_id : String | Nil = nil,
      @key_name : String | Nil = nil,
      @monitoring : SpotFleetMonitoring | Nil = nil,
      @network_interfaces : Array(InstanceNetworkInterfaceSpecification) | Nil = nil,
      @placement : SpotPlacement | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @spot_price : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @user_data : String | Nil = nil,
      @weighted_capacity : Float64 | Nil = nil,
      @tag_specifications : Array(SpotFleetTagSpecification) | Nil = nil,
      @instance_requirements : InstanceRequirements | Nil = nil,
      @security_groups : Array(GroupIdentifier) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @addressing_type
        params << {"#{prefix}AddressingType", value}
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @ebs_optimized
        params << {"#{prefix}EbsOptimized", Core::QueryValue.bool(value)}
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      if value = @monitoring
        params.concat(value.to_query_params("#{prefix}Monitoring."))
      end

      (@network_interfaces || [] of InstanceNetworkInterfaceSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NetworkInterfaceSet.#{i}."))
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @user_data
        params << {"#{prefix}UserData", value}
      end

      if value = @weighted_capacity
        params << {"#{prefix}WeightedCapacity", value.to_s}
      end

      (@tag_specifications || [] of SpotFleetTagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecificationSet.#{i}."))
      end

      if value = @instance_requirements
        params.concat(value.to_query_params("#{prefix}InstanceRequirements."))
      end

      (@security_groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        addressing_type: Core::XMLValue.string(node.xpath_node("*[local-name()='addressingType']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| BlockDeviceMapping.from_xml(n) },
        ebs_optimized: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsOptimized']")),
        iam_instance_profile: node.xpath_node("*[local-name()='iamInstanceProfile']").try { |n| IamInstanceProfileSpecification.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='keyName']")),
        monitoring: node.xpath_node("*[local-name()='monitoring']").try { |n| SpotFleetMonitoring.from_xml(n) },
        network_interfaces: node.xpath_nodes("*[local-name()='networkInterfaceSet']/*[local-name()='item']").map { |n| InstanceNetworkInterfaceSpecification.from_xml(n) },
        placement: node.xpath_node("*[local-name()='placement']").try { |n| SpotPlacement.from_xml(n) },
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramdiskId']")),
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='userData']")),
        weighted_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='weightedCapacity']")),
        tag_specifications: node.xpath_nodes("*[local-name()='tagSpecificationSet']/*[local-name()='item']").map { |n| SpotFleetTagSpecification.from_xml(n) },
        instance_requirements: node.xpath_node("*[local-name()='instanceRequirements']").try { |n| InstanceRequirements.from_xml(n) },
        security_groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end

      if value = @monitoring
        value.validate!
      end

      if value = @network_interfaces
        value.each(&.validate!)
      end

      if value = @placement
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @instance_requirements
        value.validate!
      end

      if value = @security_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@addressing_type, @block_device_mappings, @ebs_optimized, @iam_instance_profile, @image_id, @instance_type, @kernel_id, @key_name, @monitoring, @network_interfaces, @placement, @ramdisk_id, @spot_price, @subnet_id, @user_data, @weighted_capacity, @tag_specifications, @instance_requirements, @security_groups)
  end
end
